//
//  PTFetchManager.h
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//
/*
 创建人：OComme
 架构层级：业务模型
 功能描述：请求的实例
 所处位置：
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */

#import <Foundation/Foundation.h>

#import "PTFetchModel.h"

@interface PTFetchManager : NSObject

+ (void)Fetch_POSTData:(PTFetchModel *)fetchModel;

+ (void)Fetch_GETData:(PTFetchModel *)fetchModel;

+ (void)Fetch_DELETEData:(PTFetchModel *)fetchModel;

+ (void)Fetch_PUTData:(PTFetchModel *)fetchModel;

//+ (void)Fetch_HEADData:(PTFetchModel *)fetchModel;

+ (void)Fetch_PATCHData:(PTFetchModel *)fetchModel;

+ (void)Fetch_UPLOADData:(PTFetchModel *)fetchModel;

@end
