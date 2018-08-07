package api

import (
	"fmt"
	"net/http"
)

type canceler interface {
	CancelRequest(*http.Request)
}

// Transport manages injection of the API token
type AuthenticatedTransport struct {
	//API 认证票据
	Token string
	// Transport is the underlying HTTP transport to use when making
	// requests. It will default to http.DefaultTransport if nil.
	Transport http.RoundTripper
}

// RoundTrip invoked each time a request is made
func (t AuthenticatedTransport) RoundTrip(req *http.Request) (*http.Response, error) {
	if t.Token == "" {
		return nil, fmt.Errorf("Invalid token, empty string supplied")
	}

	req.Header.Set("Authorization", fmt.Sprintf("BEARER %s", t.Token))

	return t.transport().RoundTrip(req)
}

// Client builds a new http client.
func (t *AuthenticatedTransport) Client() *http.Client {
	return &http.Client{Transport: t}
}

// CancelRequest cancels an in-flight request by closing its connection.
func (t *AuthenticatedTransport) CancelRequest(req *http.Request) {
	cancelableTransport := t.Transport.(canceler)
	cancelableTransport.CancelRequest(req)
}

func (t *AuthenticatedTransport) transport() http.RoundTripper {
	// Use the custom transport if one was provided
	if t.Transport != nil {
		return t.Transport
	}

	return http.DefaultTransport
}
