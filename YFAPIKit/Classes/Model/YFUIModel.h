//
//  YFUIModel.h
//  YFAPIKit
//
//  Created by Fynil on 2017/8/15.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFTextField.h"
#import "YFInterface.h"

@interface YFUIModel : NSObject

- (instancetype)initWithPlist: (NSString *)name;
- (instancetype)initWithInterface:(YFInterface *)interface;

//plist名称， 根据此字段缓存
@property (nonatomic, strong) NSString *plistName;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, strong) NSString *downloadUrl;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSArray *textFields;
@property (nonatomic, strong) id target;
@property (nonatomic, strong) NSArray *headers;

- (NSDictionary *)getFieldsData;
- (void)reloadFields;
- (NSDictionary *)fieldsDataWithArray: (NSArray *)arr;
- (void)parseFields;
- (YFTextField *)fieldForKey: (NSString *)key;
- (YFTextField *)fieldAtIndexPath: (NSIndexPath *)indexPath;

@end
