//
//  YFConsts.h
//  YFAPIKit
//
//  Created by EvenLin on 2017/7/21.
//  Copyright © 2017年 EvenLin. All rights reserved.
//

#ifndef YFConsts_h
#define YFConsts_h


#endif /* YFConsts_h */


@import UIKit;
#import "YFApiUtil.h"
#import "YFTableView.h"

#define kRatioH(h) ((h)*kWindowH/(2*667))
#define kRatioW(w) ((w)*kWindowW/(2*375))
#define kWindowW [UIScreen mainScreen].bounds.size.width
#define kWindowH [UIScreen mainScreen].bounds.size.height

#define YFHexColor(rgbValue)[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define YFVCFromSb(VCID, SbName)     [[UIStoryboard storyboardWithName:SbName bundle:nil] instantiateViewControllerWithIdentifier:VCID]

#define YFColor [YFApiUtil sharedUtil].yfColor
#define kYFBGColor [YFApiUtil sharedUtil].backgroundColor
#define kYFNavTextColor [YFApiUtil sharedUtil].navTextColor
// NSBundle *bundle = [NSBundle bundleForClass:[SVProgressHUD class]];
#define yfDemoBundlePath [[NSBundle bundleForClass:[YFTableView class]] pathForResource:@"YFResources" ofType:@"bundle"]
#define yfDemoImage(name) [UIImage imageWithContentsOfFile:[[NSBundle bundleWithPath:yfDemoBundlePath] pathForResource:name ofType:@"png"]]


#ifdef DEBUG

#define DemoLog(fmt, ...) ((NSLog((@"%@" fmt), @"", ##__VA_ARGS__)));
#else
#define DemoLog(fmt, ...)
#endif
