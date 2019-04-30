//
//  YFViewController.m
//  YFAPIKit
//
//  Created by EvenLin on 07/13/2018.
//  Copyright (c) 2018 EvenLin. All rights reserved.
//

#import "YFViewController.h"

@interface YFViewController ()

@end

@implementation YFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self userInterfaceWithPlist:@"YFAPITest"];
    [YFSettingVC defaultSetting].defaultAddress = @"https://default.evenlin.cn";
    [YFSettingVC defaultSetting].testAddress = @"https://test.evenlin.cn";
    [YFSettingVC defaultSetting].uatAddress = @"https://uat.evenlin.cn";
}

- (void)checkUpdate {
    
}

// Click next btn action
- (void)yfNextAction {
    [super yfNextAction];
    [self requestTokenWithDic:@{} path:@"https://www.asldfjalsdjkf.com" complete:^(NSDictionary *responseDic) {
        NSLog(@"%@",responseDic);
    }];
}

@end
