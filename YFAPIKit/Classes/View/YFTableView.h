//
//  YFTableView.h
//  YFAPIKit
//
//  Created by Fynil on 2017/8/15.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTextField.h"
#import "YFHeaderView.h"
#import "YFUIModel.h"

typedef void(^DTBlock)(void);

@interface YFTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame;

- (void)addTarget: (id)target action:(SEL)action;

@property (nonatomic, strong) YFUIModel *uiModel;

@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) NSDictionary *fieldsData;

- (NSDictionary *)fieldsDataFromArray: (NSArray *)array;
- (NSDictionary *)fieldsDataForSection: (NSUInteger)section;
- (YFTextField *)field: (NSString *)key;
- (NSString *)textForKeys:(NSArray *)keys;
- (void)configWithPlist: (NSString *)plist;
- (void)configWithModel;

@property (nonatomic, copy) DTBlock headerHide;
@property (nonatomic, copy) DTBlock headerShow;

@end
