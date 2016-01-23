//
//  ZDYNewsModel.h
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDYNewsModel : NSObject

@property (nonatomic, strong) NSString * ctime;

@property (nonatomic, strong) NSString * title;

@property (nonatomic, strong) NSString * newsDescription;

@property (nonatomic, strong) NSURL * picUrl;

@property (nonatomic, strong) NSURL * url;

@end
