//
//  YFRiskItemVC.h
//  YFAPIKit
//
//  Created by Fynil on 2017/10/16.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import "YFAPIBaseVC.h"

typedef void(^RiskItemBlock)(NSString *riskItem);

@interface YFRiskItemVC : YFAPIBaseVC

@property (nonatomic, copy) RiskItemBlock riskItem;

@property (nonatomic, strong) YFInterface *interface;

@end
