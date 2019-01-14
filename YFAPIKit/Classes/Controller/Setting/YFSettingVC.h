//
//  YFSettingVC.h
//  YFAPIKit
//
//  Created by Fynil on 2018/3/15.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import "YFAPIBaseVC.h"

static NSString *testAddressKey = @"com.lianlianpay.testAddress";

typedef NS_ENUM(NSUInteger, EnvironmentType) {
    EnvironmentTypeDefault,
    EnvironmentTypeTest,
    EnvironmentTypeUAT,
};

@interface YFSettingVC : UIViewController

+ (instancetype)defaultSetting;
+ (BOOL)isDebug;
@property (nonatomic, strong) NSString *sdkAbout;
@property (nonatomic, strong) NSString *testAddress;
@property (nonatomic, strong) NSString *uatAddress;
@property (nonatomic, strong) NSString *sdkVersion;
@property (nonatomic, assign) EnvironmentType envType;

+ (EnvironmentType)environment;
+ (void)addConfiguration: (NSString *)configurationName forKey: (NSString *)key;

@end
