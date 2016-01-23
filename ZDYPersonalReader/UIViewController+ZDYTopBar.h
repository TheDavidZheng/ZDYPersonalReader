//
//  UIViewController+ZDYTopBar.h
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDYTopBar.h"

@interface UIViewController (ZDYTopBar)

@property (nonatomic, strong) ZDYTopBar * topBar;

- (void)initTopBar;

@end
