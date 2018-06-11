//
//  PublicFetchModel.m
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/11.
//  Copyright © 2018年 OComme. All rights reserved.
//

#import "PublicFetchModel.h"

@implementation PublicFetchModel

- (NSString *)urlByAppendingUrl:(NSString *)url
{
    return url;
}

- (NSDictionary *)paramentByAppendingParament:(NSDictionary *)parament
{
    return parament;
}

- (void)filteredResponseData:(NSData *)Data withSucceed:(PTFetchBlock)succeed Failed:(PTFetchBlock)failed
{

}

- (id)mapErrorData:(id)error
{
    return error;
}

@end
