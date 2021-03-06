//
//  YFInterface.h
//  YFAPIKit
//
//  Created by EvenLin on 2018/1/25.
//  Copyright © 2018年 EvenLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFInterface : NSObject

@property (nonatomic, strong) NSString *interfaceName;
@property (nonatomic, strong) NSString *headTitle;
@property (nonatomic, strong) NSString *headDetail;
@property (nonatomic, strong) NSArray *necessaryKeys;
@property (nonatomic, strong) NSArray *optionalKeys;
@property (nonatomic, strong) NSArray *sdkParams;
@property (nonatomic, strong) NSString *nextTitle;
@property (nonatomic, strong) NSString *downloadUrl;

- (instancetype)initWithName: (NSString *)name
                   headTitle: (NSString *)headTitle
                  headDetail: (NSString *)headDetail
               necessaryKeys: (NSArray *)necessaryKeys
                optionalKeys: (NSArray *)optionalKeys
                   sdkParams: (NSArray *)sdkParams;

@end
