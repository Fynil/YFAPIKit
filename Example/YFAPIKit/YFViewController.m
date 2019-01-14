//
//  YFViewController.m
//  YFAPIKit
//
//  Created by Fynil on 07/13/2018.
//  Copyright (c) 2018 Fynil. All rights reserved.
//

#import "YFViewController.h"

@interface YFViewController ()

@end

@implementation YFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self userInterfaceWithPlist:@"YFAPITest"];
}

- (void)checkUpdate {
    
}

// Click next btn action
- (void)yfNextAction {
    [super yfNextAction];
    [self requestTokenWithDic:@{} path:@"https://www.baidu.com" complete:^(NSDictionary *responseDic) {
        NSLog(@"%@",responseDic);
    }];
}

@end
