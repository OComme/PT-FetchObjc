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
        if ([self conformsToProtocol:@protocol(PTFetchProtocol)]) {
            self.delegate = (id)self;
        }
    }
    return self;
}

- (NSString *)urlString
{
    if (self.delegate) {
        return [self.delegate urlByAppendingUrl:_urlString];
    }
    return _urlString;
}

- (NSDictionary *)parametDict
{
    if (self.delegate) {
        return [self.delegate paramentByAppendingParament:_parametDict];
    }
    return _parametDict;
}

- (void)setResponseObject:(id)responseObject
{
    if (self.delegate) {
        [self.delegate filteredResponseData:responseObject withSucceed:self.succeed Failed:self.failed];
    }else{
        self.succeed(responseObject);
    }
}

- (void)setError:(id)error
{
    if (self.delegate) {
        self.failed([self.delegate mapErrorData:error]);
    }else{
        self.failed(error);
    }
}

@end
