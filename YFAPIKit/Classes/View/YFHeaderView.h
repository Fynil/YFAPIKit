//
//  YFHeaderView.h
//  YFAPIKit
//
//  Created by Fynil on 2017/8/15.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat kYFHeaderViewHeight = 80;

@interface YFHeaderView : UIView

@property (nonatomic, strong) UIImageView *imageView;
- (instancetype)initWithFrame:(CGRect)frame withName: (NSString *)name detail: (NSString *)detail andUrl: (NSString *)url;

@end
