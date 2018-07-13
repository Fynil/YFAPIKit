//
//  YFApiUtil.h
//  YFAPIKit
//
//  Created by Fynil on 2018/2/1.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YFApiUtil : NSObject

+ (instancetype)sharedUtil;

@property (nonatomic, strong) UIColor *yfColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *navTextColor;
+ (NSString *)ipAddress;
+ (NSString *)uuidString;
+ (NSString *)timeStamp;
+ (NSString *)generateOrderNO;
+ (UIBarButtonItem *)llBBIWithTitle: (NSString *)title andTarget:(id)target action: (SEL)action;

@end

@interface NSString(yfAddition)

- (NSString *)formatTime;

- (id)yfObject;

- (NSString *)yfUrlEncodedString;

- (NSString *)yfUrlDecodedString;

@end

@interface NSDictionary(yfAddition)

- (NSString *)prettyString;

- (NSString *)yfJsonString;

- (NSString *)yfSortedJsonString;

@end

@interface UIImage(yfAddition)

- (UIImage *)yf_imageInRect:(CGRect)rect scale:(CGFloat)scale bgColor:(UIColor *)bgColor rounded:(BOOL)rounded;

@end
