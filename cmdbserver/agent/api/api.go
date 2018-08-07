// api 控制管理
// 处理http请求，如果需要封装http，在这里进行包装
package api

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"mime/multipart"
	"net/http"
	"net/http/httputil"
	"net/textproto"
	"net/url"
	"reflect"
	"strings"
	"time"
	"oneoaas.com/cmdb/cmdbserver/agent/logger"
	"github.com/google/go-querystring/query"
)

const (
	defaultBaseURL   = "http://127.0.0.1:9797/"
	defaultUserAgent = "api/"
)

// A Client manages communication with the Cmdb Agent API.
type Client struct {
	// HTTP client used to communicate with the API.
	client *http.Client

	// Base URL for API requests. Defaults to the public Cmdb Agent API.
	// The URL should always be specified with a trailing slash.
	BaseURL *url.URL

	// User agent used when communicating with the Cmdb Agent API.
	UserAgent string

	// If true, requests and responses will be dumped and set to the logger
	DebugHTTP bool

	MetaData    *MetaDataService
}

// NewClient returns a new Cmdb Agent API Client.
func NewClient(httpClient *http.Client) *Client {
	baseURL, _ := url.Parse(defaultBaseURL)

	c := &Client{
		client:    httpClient,
		BaseURL:   baseURL,
		UserAgent: defaultUserAgent,
	}

	//设置服务
	c.MetaData = &MetaDataService{c}

	return c
}

// NewRequest creates an API request. A relative URL can be provided in urlStr,
// in which case it is resolved relative to the BaseURL of the Client.
// Relative URLs should always be specified without a preceding slash. If
// specified, the value pointed to by body is JSON encoded and included as the
// request body.
func (c *Client) NewRequest(method, urlStr string, body interface{}) (*http.Request, error) {
	u := joinURL(c.BaseURL.String(), urlStr)
	buf := new(bytes.Buffer)
	if body != nil {
		err := json.NewEncoder(buf).Encode(body)
		if err != nil {
			return nil, err
		}
	}

	logger.Info("请求路径是[%s]",u)
	req, err := http.NewRequest(method, u, buf)
	if err != nil {
		return nil, err
	}

	//req.Header.Add("User-Agent", c.UserAgent)

	if body != nil {
		req.Header.Add("Content-Type", "application/json")
	}

	return req, nil
}


// NewFormRequest creates an mutli-part form request. A relative URL can be
// provided in urlStr, in which case it is resolved relative to the UploadURL
// of the Client. Relative URLs should always be specified without a preceding
// slash.
func (c *Client) NewFormRequest(method, urlStr string, body *bytes.Buffer) (*http.Request, error) {
	u := joinURL(c.BaseURL.String(), urlStr)

	req, err := http.NewRequest(method, u, body)
	if err != nil {
		return nil, err
	}

	if c.UserAgent != "" {
		req.Header.Add("User-Agent", c.UserAgent)
	}

	return req, nil
}

// Response is a Cmdb Agent API response. This wraps the standard
// http.Response.
type Response struct {
	*http.Response
}

// newResponse creates a new Response for the provided http.Response.
func newResponse(r *http.Response) *Response {
	response := &Response{Response: r}
	return response
}

// Do sends an API request and returns the API response. The API response is
// JSON decoded and stored in the value pointed to by v, or returned as an
// error if an API error has occurred.  If v implements the io.Writer
// interface, the raw response body will be written to v, without attempting to
// first decode it.
func (c *Client) Do(req *http.Request, v interface{}) (*Response, error) {
	var err error

	if c.DebugHTTP {
		// If the request is a multi-part form, then it's probably a
		// file upload, in which case we don't want to spewing out the
		// file contents into the debug log (especially if it's been
		// gzipped)
		var requestDump []byte
		if strings.Contains(req.Header.Get("Content-Type"), "multipart/form-data") {
			requestDump, err = httputil.DumpRequestOut(req, false)
		} else {
			requestDump, err = httputil.DumpRequestOut(req, true)
		}

		logger.Debug("ERR: %s\n%s", err, string(requestDump))
	}

	ts := time.Now()

	logger.Debug("%s %s", req.Method, req.URL)

	resp, err := c.client.Do(req)
	if err != nil {
		return nil, err
	}

	logger.Debug("↳ %s %s (%s %s)", req.Method, req.URL, resp.Status, time.Now().Sub(ts))

	response := newResponse(resp)

	if c.DebugHTTP {
		responseDump, err := httputil.DumpResponse(resp, true)
		logger.Debug("\nERR: %s\n%s", err, string(responseDump))
	}

	return response, err
}

// ErrorResponse provides a message.
type ErrorResponse struct {
	Response *http.Response // HTTP response that caused this error
	Message  string         `json:"message" msgpack:"message"` // error message
}

func (r *ErrorResponse) Error() string {
	s := fmt.Sprintf("%v %v: %d",
		r.Response.Request.Method, r.Response.Request.URL,
		r.Response.StatusCode)

	if r.Message != "" {
		s = fmt.Sprintf("%s %v", s, r.Message)
	}

	return s
}


// addOptions adds the parameters in opt as URL query parameters to s. opt must
// be a struct whose fields may contain "url" tags.
func addOptions(s string, opt interface{}) (string, error) {
	v := reflect.ValueOf(opt)
	if v.Kind() == reflect.Ptr && v.IsNil() {
		return s, nil
	}

	u, err := url.Parse(s)
	if err != nil {
		return s, err
	}

	qs, err := query.Values(opt)
	if err != nil {
		return s, err
	}

	u.RawQuery = qs.Encode()
	return u.String(), nil
}

// Copied from http://golang.org/src/mime/multipart/writer.go
var quoteEscaper = strings.NewReplacer("\\", "\\\\", `"`, "\\\"")

func escapeQuotes(s string) string {
	return quoteEscaper.Replace(s)
}

// createFormFileWithContentType is a copy of the CreateFormFile method, except
// you can change the content type it uses (by default you can't)
func createFormFileWithContentType(w *multipart.Writer, fieldname, filename, contentType string) (io.Writer, error) {
	h := make(textproto.MIMEHeader)
	h.Set("Content-Disposition",
		fmt.Sprintf(`form-data; name="%s"; filename="%s"`,
			escapeQuotes(fieldname), escapeQuotes(filename)))
	h.Set("Content-Type", contentType)
	return w.CreatePart(h)
}

func joinURL(endpoint string, path string) string {
	return strings.TrimRight(endpoint, "/") + "/" + strings.TrimLeft(path, "/")
}