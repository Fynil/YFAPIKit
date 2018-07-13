//
//  YFAPIBaseVC.h
//  YFAPIKit
//
//  Created by Fynil on 2017/9/21.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTableView.h"
#import "YFConsts.h"
#import "YFResultInfoVC.h"
#import "YFInterface.h"
#import "YFApiUtil.h"
#import "YFSettingVC.h"
#import <SVProgressHUD/SVProgressHUD.h>

@import CoreLocation;

typedef void (^ExitParam)(NSDictionary* exitParam);

@interface YFAPIBaseVC : UIViewController

@property (nonatomic, strong) CLLocationManager* locationMgr;
@property (nonatomic, strong) YFTableView* tableView;
@property (nonatomic, strong) NSMutableDictionary* paymentInfo;
@property (nonatomic, copy) ExitParam exitParam;
@property (nonatomic, assign) BOOL showHud;
@property (nonatomic, strong) NSString *merchantTest;
@property (nonatomic, strong) NSString *merchantRelease;

#pragma mark - UI

- (void)userInterfaceWithPlist:(NSString*)plist;
- (void)userInterfaceWithModel:(YFUIModel*)model;
- (void)userInterfaceWithInterface:(YFInterface*)interface;
- (void)uiStyleConfiguration;
- (void)yfNavConfig;

#pragma mark - action

//检查更新方法
- (void)checkUpdate;
- (void)yfNextAction;
- (void)pushInfoVCWithTitle:(NSString*)title andDic:(NSDictionary*)dic;
- (void)pushInfoVC:(NSString*)title success:(BOOL)success text:(NSString*)text detail:(NSString*)detail info:(NSDictionary*)info;
- (void)alertWithMsg:(NSString*)msg;
- (void)yfAlertWithTitle:(NSString*)title andMsg:(NSString*)msg;

- (NSString*)keyForMerchant;
- (NSString*)keyForMerchant:(NSString*)merchant isRSA:(BOOL)isRSA;
- (NSString*)text:(NSString*)key;

@end

#pragma mark - Right Action

@interface YFAPIBaseVC (RightAction)

- (void)refreshTimeRelatedTexts;

- (void)requestTokenWithDic:(NSDictionary*)paramDic path:(NSString*)path complete:(void (^)(NSDictionary* responseDic))complete;

@end
