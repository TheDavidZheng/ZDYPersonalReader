//
//  ZDYNewsViewModel.m
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import "ZDYNewsViewModel.h"

@implementation ZDYNewsViewModel

- (void)fetchNewsList {
    NSDictionary * parameter = @{@"key": NEWS_KEY,
                                 @"num": @"50"};
    
    [NetRequestClass NetRequestGETWithRequestURL:NEWS_ADDRESS WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        LogGreen(@"%@", returnValue);
        [self fetchValueSuccessWithDic:returnValue];
    } WithErrorCodeBlock:^(id errorCode) {
        
    } WithFailureBlock:^{
        
    }];
}

#pragma 获取到正确的数据，对正确的数据进行处理
-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue
{
//    对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    NSArray *statuses = returnValue[@"newslist"];
    NSMutableArray *newsModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];

    for (int i = 0; i < statuses.count; i ++) {
        ZDYNewsModel * newsModel = [[ZDYNewsModel alloc] init];
        
//        //设置时间
//        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
//        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
//        
//        //必须设置，否则无法解析
//        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//        NSDate *date=[iosDateFormater dateFromString:statuses[i][@"ctime"]];
//        
//        //目的格式
//        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
//        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        newsModel.ctime = statuses[i][@"ctime"];
        newsModel.title = statuses[i][@"title"];
        newsModel.newsDescription = statuses[i][@"newsDescription"];
        newsModel.picUrl = [NSURL URLWithString:statuses[i][@"picUrl"]];
        newsModel.url = [NSURL URLWithString:statuses[i][@"url"]];
        
        [newsModelArray addObject:newsModel];
        
    }
    
    self.returnBlock(newsModelArray);
}

#pragma 对ErrorCode进行处理
-(void) errorCodeWithDic: (NSDictionary *) errorDic
{
    self.errorBlock(errorDic);
}

#pragma 对网路异常进行处理
-(void) netFailure
{
    self.failureBlock();
}

@end
