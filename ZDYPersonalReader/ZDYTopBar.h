//
//  ZDYTopBar.h
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDYTopBar : UIView

@property (nonatomic, strong) UIButton * buttonLeft;
@property (nonatomic, strong) UIButton * buttonRight;

@property (nonatomic, strong) UIView * viewInCenter;
@property (nonatomic, strong) UIView * lineBottom;

- (void)setViewInCenterWithTitle:(NSString *)title;
- (void)setViewInCenterWithTitle:(NSString *)title
                         color:(UIColor *)color;
- (void)setViewInCenterWithTitle:(NSString *)title
                         color:(UIColor *)color
                          font:(UIFont *)font;

@end
