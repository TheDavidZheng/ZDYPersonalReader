//
//  ZDYViewModelClass.m
//  ZDYPersonalReader
//
//  Created by david on 16/1/23.
//  Copyright © 2016年 david. All rights reserved.
//

#import "ZDYViewModelClass.h"
#import "NetRequestClass.h"

@implementation ZDYViewModelClass

#pragma 获取网络可到达状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkBlock) netConnectBlock WithURlStr: (NSString *) strURl;
{
    BOOL netState = [NetRequestClass netWorkReachabilityWithURLString:strURl];
    netConnectBlock(netState);
}

#pragma 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

@end
