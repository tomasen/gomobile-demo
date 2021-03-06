// Objective-C API for talking to github.com/tomasen/gomobile-demo/sdk Go package.
//   gobind -lang=objc github.com/tomasen/gomobile-demo/sdk
//
// File is generated by gobind. Do not edit.

#include "GoGopherKit.h"
#include <Foundation/Foundation.h>
#include "seq.h"

static NSString* errDomain = @"go.github.com/tomasen/gomobile-demo/sdk";

@protocol goSeqRefInterface
-(GoSeqRef*) _ref;
@end

#define _DESCRIPTOR_ "GopherKit"

@class GoGopherKitCallback;

@interface GoGopherKitCallback : NSObject <GoGopherKitCallback> {
}
@property(strong, readonly) id _ref;

- (id)initWithRef:(id)ref;
- (void)stateDidUpdate;
@end

#define _GO_GopherKit_State_DESCRIPTOR_ "go.GopherKit.State"
#define _GO_GopherKit_State_FIELD_NanoTimeStamp_GET_ (0x00f)
#define _GO_GopherKit_State_FIELD_NanoTimeStamp_SET_ (0x01f)
#define _GO_GopherKit_State_FIELD_Message_GET_ (0x10f)
#define _GO_GopherKit_State_FIELD_Message_SET_ (0x11f)

@implementation GoGopherKitState {
}

- (id)initWithRef:(id)ref {
	self = [super init];
	if (self) { __ref = ref; }
	return self;
}

- (int64_t)nanoTimeStamp {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_writeRef(&in_, self._ref);
	go_seq_send(_GO_GopherKit_State_DESCRIPTOR_, _GO_GopherKit_State_FIELD_NanoTimeStamp_GET_, &in_, &out_);
	int64_t ret_ = go_seq_readInt64(&out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
	return ret_;
}

- (void)setNanoTimeStamp:(int64_t)v {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_writeRef(&in_, self._ref);
	go_seq_writeInt64(&in_, v);
	go_seq_send(_GO_GopherKit_State_DESCRIPTOR_, _GO_GopherKit_State_FIELD_NanoTimeStamp_SET_, &in_, &out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
}

- (NSString*)message {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_writeRef(&in_, self._ref);
	go_seq_send(_GO_GopherKit_State_DESCRIPTOR_, _GO_GopherKit_State_FIELD_Message_GET_, &in_, &out_);
	NSString* ret_ = go_seq_readUTF8(&out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
	return ret_;
}

- (void)setMessage:(NSString*)v {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_writeRef(&in_, self._ref);
	go_seq_writeUTF8(&in_, v);
	go_seq_send(_GO_GopherKit_State_DESCRIPTOR_, _GO_GopherKit_State_FIELD_Message_SET_, &in_, &out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
}

@end

#define _GO_GopherKit_Callback_DESCRIPTOR_ "go.GopherKit.Callback"
#define _GO_GopherKit_Callback_StateDidUpdate_ (0x10a)

@implementation GoGopherKitCallback {
}

- (id)initWithRef:(id)ref {
	self = [super init];
	if (self) { __ref = ref; }
	return self;
}

- (void)stateDidUpdate {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_writeRef(&in_, self._ref);
	go_seq_send(_GO_GopherKit_Callback_DESCRIPTOR_, _GO_GopherKit_Callback_StateDidUpdate_, &in_, &out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
}

@end

static void proxyGoGopherKitCallback(id obj, int code, GoSeq* in, GoSeq* out) {
	switch (code) {
	case _GO_GopherKit_Callback_StateDidUpdate_: {
		id<GoGopherKitCallback> o = (id<GoGopherKitCallback>)(obj);
		[o stateDidUpdate];
	} break;
	default:
		NSLog(@"unknown code %x for _GO_GopherKit_Callback_DESCRIPTOR_", code);
	}
}

#define _CALL_GetState_ 1
#define _CALL_RegisterCallback_ 2
#define _CALL_Start_ 3

GoGopherKitState* GoGopherKitGetState() {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_send(_DESCRIPTOR_, _CALL_GetState_, &in_, &out_);
	GoSeqRef* ret0__ref = go_seq_readRef(&out_);
	GoGopherKitState* ret0_ = ret0__ref.obj;
	if (ret0_ == NULL) {
		ret0_ = [[GoGopherKitState alloc] initWithRef:ret0__ref];
	}
	go_seq_free(&in_);
	go_seq_free(&out_);
	return ret0_;
}

void GoGopherKitRegisterCallback(id<GoGopherKitCallback> c) {
	GoSeq in_ = {};
	GoSeq out_ = {};
	if ([(id<NSObject>)(c) isKindOfClass:[GoGopherKitCallback class]]) {
		id<goSeqRefInterface> c_proxy = (id<goSeqRefInterface>)(c);
		go_seq_writeRef(&in_, c_proxy._ref);
	} else {
		go_seq_writeObjcRef(&in_, c);
	}
	go_seq_send(_DESCRIPTOR_, _CALL_RegisterCallback_, &in_, &out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
}

void GoGopherKitStart() {
	GoSeq in_ = {};
	GoSeq out_ = {};
	go_seq_send(_DESCRIPTOR_, _CALL_Start_, &in_, &out_);
	go_seq_free(&in_);
	go_seq_free(&out_);
}

__attribute__((constructor)) static void init() {
	go_seq_register_proxy("go.GopherKit.Callback", proxyGoGopherKitCallback);
}
