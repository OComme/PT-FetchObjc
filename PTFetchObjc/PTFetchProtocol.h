//
//  PTFetchProtocol.h
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//
/*
 创建人：OComme
 功能描述：数据处理的代理方法
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */

#import <Foundation/Foundation.h>
typedef void(^PTFetchBlock)(id);

@protocol PTFetchProtocol <NSObject>

/**
 拼接字符串
 */
- (NSString *)urlByAppendingUrl:(NSString *)url;

/**
 拼接参数
 */
- (NSDictionary *)paramentByAppendingParament:(NSDictionary *)parament;

/**
 筛选返回数据
 */
- (void)filteredResponseData:(NSData *)Data withSucceed:(PTFetchBlock)succeed Failed:(PTFetchBlock)failed;

/**
 处理错误信息
 */
- (id)mapErrorData:(id)error;

@end
