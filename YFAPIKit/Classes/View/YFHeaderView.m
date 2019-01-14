//
//  YFHeaderView.m
//  YFAPIKit
//
//  Created by Fynil on 2017/8/15.
//  Copyright © 2017年 Fynil. All rights reserved.
//

#import "YFHeaderView.h"
#import "YFConsts.h"

@interface YFHeaderView ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *detail;

@end

@implementation YFHeaderView

- (instancetype)initWithFrame:(CGRect)frame withName: (NSString *)name detail: (NSString *)detail andUrl: (NSString *)url {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = YFColor;
        self.name = name;
        self.detail = detail;
        self.url = url;
        [self tableHeaderView];
    }
    return self;
}

- (UIView *)tableHeaderView {
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = YFColor;
    bgView.frame = CGRectMake(0, -kWindowH, kWindowW, kWindowH + kYFHeaderViewHeight);
    [self addSubview:bgView];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = kYFNavTextColor;
    label.font = [UIFont boldSystemFontOfSize:28];
    label.frame = CGRectMake(10, 15, 200, 30);
    label.text = self.name;
    label.adjustsFontSizeToFitWidth = YES;
    [self addSubview:label];
    label.userInteractionEnabled = YES;
    if (self.detail.length > 0) {
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 200, 20)];
        label2.adjustsFontSizeToFitWidth = YES;
        label2.font = [UIFont systemFontOfSize:12];
        label2.textColor = kYFNavTextColor;
        label2.text = self.detail?:@"";
        [self addSubview:label2];
    } else {
        label.frame = CGRectMake(10, 25, 200, 30);
    }
    if (self.url.length > 0) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(downloadNewDemo)];
        [self addGestureRecognizer:tap];
        UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToSafari)];
        press.minimumPressDuration = 0.5;
        [self addGestureRecognizer:press];
    }
    
    CGFloat ivheight = 40;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWindowW - 30- ivheight, kYFHeaderViewHeight/2-ivheight/2, ivheight, ivheight)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.image = yfDemoImage(@"textIcon");
    [self addSubview:self.imageView];
    return self;
}

- (void)downloadNewDemo {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com.lianlianpay.checkUpdate" object:nil];
}

- (void)jumpToSafari {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.url]];
}

@end
