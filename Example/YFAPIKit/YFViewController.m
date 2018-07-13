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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)checkUpdate {
    NSLog(@"\n\n🌙%s🌙\n\n",__FUNCTION__);
}

// Click next btn action
- (void)yfNextAction {
    [super yfNextAction];
    [self requestTokenWithDic:@{} path:@"https://www.baidu.com" complete:^(NSDictionary *responseDic) {
        NSLog(@"%@",responseDic);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
