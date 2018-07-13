//
//  YFRiskItemVC.m
//  YFAPIKit
//
//  Created by Fynil on 2017/10/16.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import "YFRiskItemVC.h"
#import "YFInterface.h"
#import "YFIDCardGenerator.h"

@interface YFRiskItemVC ()

@end

@implementation YFRiskItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.interface) {
        self.interface = [[YFInterface alloc] initWithName:@"LLRiskItem" headTitle:@"风控参数配置" headDetail:@"risk_item" necessaryKeys:nil optionalKeys:@[@"user_info_mercht_userno",@"user_info_dt_register",@"user_info_full_name",@"user_info_id_no",@"user_info_identify_type",@"user_info_identify_state",@"frms_ip_addr"] sdkParams:nil];
    }
    [self userInterfaceWithInterface:self.interface];
}

- (void)generateIDCard {
    [self.tableView field:@"user_info_id_no"].text = [YFIDCardGenerator generateIDCard];
}

- (void)yfNextAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSDictionary *dic = [self.tableView fieldsData];
    self.riskItem(dic.yfSortedJsonString);
}

@end
