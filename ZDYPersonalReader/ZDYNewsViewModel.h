//
//  ZDYNewsViewModel.h
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDYNewsModel.h"
#import "ZDYViewModelClass.h"

@interface ZDYNewsViewModel : ZDYViewModelClass

- (void)fetchNewsList;

@end
