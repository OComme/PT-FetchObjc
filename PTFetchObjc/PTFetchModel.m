//
//  PTFetchModel.m
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//

#import "PTFetchModel.h"

@interface PTFetchModel ()
{
    NSString *_urlString;
    NSDictionary *_parametDict;
}

/**
 当前类的子类
 */
@property (nullable,nonatomic,weak) id<PTFetchProtocol> delegate;

@end

@implementation PTFetchModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldAppend = YES;
        
        NSAssert([self conformsToProtocol:@protocol(PTFetchProtocol)], @"PTFetchModel的子类必须遵循 PTFetchProtocol 代理方法");
        self.delegate = (id)self;
    }
    return self;
}

- (NSString *)urlString
{
    if (self.shouldAppend) {
        return [self.delegate urlByAppendingUrl:_urlString];
    }
    return _urlString;
}

- (NSDictionary *)parametDict
{
    if (self.shouldAppend) {
        return [self.delegate paramentByAppendingParament:_parametDict];
    }
    return _parametDict;
}

- (void)setResponseObject:(id)responseObject
{
    [self.delegate filteredResponseData:responseObject withSucceed:self.succeed Failed:self.failed];
}

- (void)setError:(id)error
{
    self.failed([self.delegate mapErrorData:error]);
}

@end
