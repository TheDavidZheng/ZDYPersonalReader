//
//  Config.h
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#ifndef ZDYPersonalReader_Config_h
#define ZDYPersonalReader_Config_h

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock) ();
typedef void (^NetWorkBlock) (BOOL netConnetState);

/**
 *
 */
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

/**
 *
 */
#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })

/**
 *
 */
#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define WINDOW [UIApplication sharedApplication].delegate.window

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 && [[[UIDevice currentDevice] systemVersion] floatValue] < 8)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8 && [[[UIDevice currentDevice] systemVersion] floatValue] < 9)
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue] // 检查iOS系统版本
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 * 屏幕尺寸
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/**
 *
 */
#define IS_IPHONE_4 CGSizeEqualToSize(CGSizeMake(320, 480), [UIScreen mainScreen].bounds.size)
#define IS_IPHONE_5 CGSizeEqualToSize(CGSizeMake(320, 568), [UIScreen mainScreen].bounds.size)
#define IS_IPHONE_6 CGSizeEqualToSize(CGSizeMake(375, 667), [UIScreen mainScreen].bounds.size)
#define IS_IPHONE_6P CGSizeEqualToSize(CGSizeMake(414, 736), [UIScreen mainScreen].bounds.size)

#define SCREEN_SIZE_IPHONE4 CGSizeMake(320, 480)
#define SCREEN_SIZE_IPHONE5 CGSizeMake(320, 568)
#define SCREEN_SIZE_IPHONE6 CGSizeMake(375, 667)
#define SCREEN_SIZE_IPHONE6P CGSizeMake(414, 736)

/**
 *
 */
#define TICK(timeStart) NSDate *timeStart = [NSDate date];
#define TOCK(timeStart, keyword) LogRed(@"[time_cost]: %f, %@", -[timeStart timeIntervalSinceNow], keyword);

/**
 *
 */
#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogPurple(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg209,57,168;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#define LogBGBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"bg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogBGRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"bg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogBGGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"bg0,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#define HexColor(hexString) [UIColor colorWithHexString:hexString]
#define HexAlphaColor(hexString, hexAlpha) [UIColor colorWithHexString:hexString alpha:hexAlpha]


#endif /* Config_h */
