//
//  ZDYTopBar.m
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import "ZDYTopBar.h"
#import "Common.h"

@implementation ZDYTopBar

- (void)setViewInCenterWithTitle:(NSString *)title
                           color:(UIColor *)color
                            font:(UIFont *)font
{
    if (self.viewInCenter && self.viewInCenter.superview) {
        [self.viewInCenter removeFromSuperview];
    }
    
    UILabel * label = [[UILabel alloc] init];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color;
    label.font = font;
    [label sizeToFit];
    
    self.viewInCenter = label;
    
    [self addSubview:label];
    [label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(20/2);
    }];
}

- (void)setViewInCenterWithTitle:(NSString *)title color:(UIColor *)color
{
    [self setViewInCenterWithTitle:title color:color font:[UIFont systemFontOfSize:18]];
}

- (void)setViewInCenterWithTitle:(NSString *)title
{
    [self setViewInCenterWithTitle:title color:[UIColor colorWithHexString:@"655f5f"]];
}

@end
