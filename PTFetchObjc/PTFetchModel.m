//
//  PTFetchModel.m
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//

#import "PTFetchModel.h"

@implementation PTFetchModel
/// 数据处理对象
static id<PTFetchProtocol> PTFetchModelDelegate;

+ (void)SetFetchModelDelegate:(id<PTFetchProtocol>)delegate
{
    PTFetchModelDelegate = delegate;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldAppend = YES;
        NSAssert(PTFetchModelDelegate != nil, @"PTFetchModel 必须设置 代理对象");
    }
    return self;
}

- (NSString *)urlString
{
    if (self.shouldAppend) {
        return [PTFetchModelDelegate appentUrlWithShortUrl:_urlString];
    }
    return _urlString;
}

- (NSDictionary *)parametDict
{
    if (self.shouldAppend) {
        return [PTFetchModelDelegate appentParamentsWithShortParament:_parametDict];
    }
    return _parametDict;
}

- (void)setResponseObject:(id)responseObject
{
    [PTFetchModelDelegate dealRulesWithData:responseObject :self.succeed :self.failed];
}

- (void)setError:(id)error
{
    [PTFetchModelDelegate dealErrorData:error :self.failed];
}

@end
