//
//  YFSharingDataVC.m
//  YFAPIKit
//
//  Created by Fynil on 2017/11/2.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import "YFSharingDataVC.h"
#import "YFInterface.h"

@interface YFSharingDataVC ()

@end

@implementation YFSharingDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    YFInterface *interface = [[YFInterface alloc] initWithName:@"LLSharingData" headTitle:@"分账说明" headDetail:@"shareing_data" necessaryKeys:@[@"oid_partner",@"busi_partner",@"money_order",@"sharingDataInfo"] optionalKeys:nil sdkParams:nil];
    [self userInterfaceWithInterface:interface];
}

//201412030000035903^101001^10^分账说明1|201310102000003524^101001^11^分账说明2|201307232000003510^109001^12^分账说明3"
- (void)viewWillDisappear:(BOOL)animated {
    NSMutableArray *arr = [NSMutableArray array];
    for (YFTextField *field in self.tableView.uiModel.textFields.firstObject[@"fields"]) {
        [arr addObject:field.text];
    }
    NSString *string = [arr componentsJoinedByString:@"^"];
    self.exitParam(@{@"shareing_data":string});
}

- (void)yfNextAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
