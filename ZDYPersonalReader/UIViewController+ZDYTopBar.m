//
//  UIViewController+ZDYTopBar.m
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import "UIViewController+ZDYTopBar.h"
#import <objc/runtime.h>

static UIView *uiviewcontroller_topbar = nil;

@implementation UIViewController (ZDYTopBar)

#pragma mark - Associate
- (void)setTopBar:(ZDYTopBar *)topBar_ {
    objc_setAssociatedObject(self,(__bridge const void *)(uiviewcontroller_topbar),topBar_,OBJC_ASSOCIATION_RETAIN);
}

- (ZDYTopBar *)topBar {
    return objc_getAssociatedObject(self,(__bridge const void *)(uiviewcontroller_topbar));
}

- (void)initTopBar {
    self.topBar = [[ZDYTopBar alloc] init];
    
    [self.view addSubview:self.topBar];
    [self.topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@64);
    }];
}

@end
