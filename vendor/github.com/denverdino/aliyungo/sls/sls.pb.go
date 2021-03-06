// Code generated by protoc-gen-go.
// source: sls.proto
// DO NOT EDIT!

/*
Package sls is a generated protocol buffer package.

It is generated from these files:
	sls.proto

It has these top-level messages:
	Log
	LogGroup
	LogGroupList
*/
package sls

import proto "github.com/golang/protobuf/proto"
import fmt "fmt"
import math "math"

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
const _ = proto.ProtoPackageIsVersion1

type Log struct {
	Time             *uint32        `protobuf:"varint,1,req,name=time" json:"time,omitempty"`
	Contents         []*Log_Content `protobuf:"bytes,2,rep,name=contents" json:"contents,omitempty"`
	XXX_unrecognized []byte         `json:"-"`
}

func (m *Log) Reset() {
	*m = Log{}
}
func (m *Log) String() string {
	return proto.CompactTextString(m)
}
func (*Log) ProtoMessage() {}
func (*Log) Descriptor() ([]byte, []int) {
	return fileDescriptor0, []int{0}
}

func (m *Log) GetTime() uint32 {
	if m != nil && m.Time != nil {
		return *m.Time
	}
	return 0
}

func (m *Log) GetContents() []*Log_Content {
	if m != nil {
		return m.Contents
	}
	return nil
}

type Log_Content struct {
	Key              *string `protobuf:"bytes,1,req,name=key" json:"key,omitempty"`
	Value            *string `protobuf:"bytes,2,req,name=value" json:"value,omitempty"`
	XXX_unrecognized []byte  `json:"-"`
}

func (m *Log_Content) Reset() {
	*m = Log_Content{}
}
func (m *Log_Content) String() string {
	return proto.CompactTextString(m)
}
func (*Log_Content) ProtoMessage() {}
func (*Log_Content) Descriptor() ([]byte, []int) {
	return fileDescriptor0, []int{0, 0}
}

func (m *Log_Content) GetKey() string {
	if m != nil && m.Key != nil {
		return *m.Key
	}
	return ""
}

func (m *Log_Content) GetValue() string {
	if m != nil && m.Value != nil {
		return *m.Value
	}
	return ""
}

type LogGroup struct {
	Logs             []*Log  `protobuf:"bytes,1,rep,name=logs" json:"logs,omitempty"`
	Reserved         *string `protobuf:"bytes,2,opt,name=reserved" json:"reserved,omitempty"`
	Topic            *string `protobuf:"bytes,3,opt,name=topic" json:"topic,omitempty"`
	Source           *string `protobuf:"bytes,4,opt,name=source" json:"source,omitempty"`
	XXX_unrecognized []byte  `json:"-"`
}

func (m *LogGroup) Reset() {
	*m = LogGroup{}
}
func (m *LogGroup) String() string {
	return proto.CompactTextString(m)
}
func (*LogGroup) ProtoMessage() {}
func (*LogGroup) Descriptor() ([]byte, []int) {
	return fileDescriptor0, []int{1}
}

func (m *LogGroup) GetLogs() []*Log {
	if m != nil {
		return m.Logs
	}
	return nil
}

func (m *LogGroup) GetReserved() string {
	if m != nil && m.Reserved != nil {
		return *m.Reserved
	}
	return ""
}

func (m *LogGroup) GetTopic() string {
	if m != nil && m.Topic != nil {
		return *m.Topic
	}
	return ""
}

func (m *LogGroup) GetSource() string {
	if m != nil && m.Source != nil {
		return *m.Source
	}
	return ""
}

type LogGroupList struct {
	LogGroupList     []*LogGroup `protobuf:"bytes,1,rep,name=logGroupList" json:"logGroupList,omitempty"`
	XXX_unrecognized []byte      `json:"-"`
}

func (m *LogGroupList) Reset() {
	*m = LogGroupList{}
}
func (m *LogGroupList) String() string {
	return proto.CompactTextString(m)
}
func (*LogGroupList) ProtoMessage() {}
func (*LogGroupList) Descriptor() ([]byte, []int) {
	return fileDescriptor0, []int{2}
}

func (m *LogGroupList) GetLogGroupList() []*LogGroup {
	if m != nil {
		return m.LogGroupList
	}
	return nil
}

func init() {
	proto.RegisterType((*Log)(nil), "Log")
	proto.RegisterType((*Log_Content)(nil), "Log.Content")
	proto.RegisterType((*LogGroup)(nil), "LogGroup")
	proto.RegisterType((*LogGroupList)(nil), "LogGroupList")
}

var fileDescriptor0 = []byte{
	// 193 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x09, 0x6e, 0x88, 0x02, 0xff, 0x4c, 0x8c, 0xcd, 0x4a, 0xc5, 0x30,
	0x10, 0x46, 0x69, 0x13, 0xb5, 0x9d, 0xa6, 0x22, 0xb3, 0x0a, 0x2e, 0xb4, 0x14, 0x84, 0xae, 0x22,
	0xf8, 0x0a, 0x2e, 0xdc, 0x14, 0xdc, 0xbb, 0x93, 0x3a, 0x94, 0x62, 0xec, 0x94, 0x24, 0x2d, 0xf8,
	0xf6, 0x37, 0xfd, 0x83, 0xbb, 0x9b, 0x33, 0x7c, 0xe7, 0x40, 0xee, 0xad, 0x37, 0x93, 0xe3, 0xc0,
	0xf5, 0x17, 0x88, 0x96, 0x7b, 0x54, 0x20, 0xc3, 0xf0, 0x47, 0x3a, 0xa9, 0xd2, 0xa6, 0xc4, 0x27,
	0xc8, 0x3a, 0x1e, 0x03, 0x8d, 0xc1, 0xeb, 0xb4, 0x12, 0x4d, 0xf1, 0xa6, 0x4c, 0x5c, 0x99, 0xf7,
	0xfd, 0xf9, 0xf8, 0x02, 0x77, 0xc7, 0x89, 0x05, 0x88, 0x5f, 0xfa, 0xdf, 0xbc, 0x1c, 0x4b, 0xb8,
	0x59, 0xbe, 0xed, 0x4c, 0x51, 0x8a, 0x58, 0x7f, 0x42, 0x16, 0xad, 0x0f, 0xc7, 0xf3, 0x84, 0x08,
	0xd2, 0x72, 0xef, 0xe3, 0x70, 0xcd, 0xc9, 0x35, 0x87, 0x0f, 0x90, 0x39, 0xf2, 0xe4, 0x16, 0xfa,
	0x89, 0x46, 0xb2, 0x07, 0x02, 0x4f, 0x43, 0xa7, 0xc5, 0x86, 0xf7, 0x70, 0xeb, 0x79, 0x76, 0x1d,
	0x69, 0xb9, 0x72, 0xfd, 0x0a, 0xea, 0x0c, 0xb6, 0x83, 0x0f, 0xf8, 0x0c, 0xca, 0x5e, 0xf1, 0x11,
	0xcf, 0xcd, 0x39, 0xba, 0x04, 0x00, 0x00, 0xff, 0xff, 0x77, 0xa0, 0x66, 0x2b, 0xe9, 0x00, 0x00,
	0x00,
}
