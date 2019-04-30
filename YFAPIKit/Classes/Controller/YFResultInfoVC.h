//
//  YFResultInfoVC.h
//  YFAPIKit
//
//  Created by EvenLin on 2016/12/19.
//  Copyright © 2016年 EvenLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFResultInfoVC : UIViewController

- (instancetype)initWithInfoDic: (NSDictionary *)dic;
@property (nonatomic, getter=isSuccess) BOOL success;
@property (nonatomic, assign) BOOL showHeadView;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *detail;

@end
