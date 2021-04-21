#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AutoHeightTextView.h"
#import "DrawPathInfo.h"
#import "DrawPathView.h"
#import "ImageButton.h"
#import "MouseEventProtocol.h"
#import "NSColor+Helper.h"
#import "SimpleLabelView.h"
#import "SnipManager.h"
#import "SnipUtil.h"
#import "SnipView.h"
#import "SnipWindow.h"
#import "SnipWindowController.h"
#import "ToolContainer.h"

FOUNDATION_EXPORT double ZDSnipVersionNumber;
FOUNDATION_EXPORT const unsigned char ZDSnipVersionString[];

