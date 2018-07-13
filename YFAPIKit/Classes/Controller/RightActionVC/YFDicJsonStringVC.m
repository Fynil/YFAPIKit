//
//  YFDicJsonStringVC.m
//  YFAPIKit
//
//  Created by Fynil on 2018/5/31.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import "YFDicJsonStringVC.h"

@interface YFDicJsonStringVC ()

@end

@implementation YFDicJsonStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.interface) {
        self.interface.nextTitle = @"确定";
        [self userInterfaceWithInterface:self.interface];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"无参数传入" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.interface == nil) {
        return;
    }
    NSDictionary *dic = [self.tableView fieldsData];
    self.exitParam(dic?:nil);
}

- (void)yfNextAction {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
