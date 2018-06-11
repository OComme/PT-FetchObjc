//
//  PTFetchModel.h
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//
/*
 创建人：admin
 功能描述：创建HTTP请求相关的配置模型
 所处位置：
 创建版本：V 0.0.1
 --修改人：
 修改版本：
 修改描述：
 */

#import <Foundation/Foundation.h>
#import "PTFetchUploadData.h"
#import "PTFetchProtocol.h"

@interface PTFetchModel : NSObject

//=============================dataDeal======================================
/**
 待处理请求的结果数据
 */
- (void)setResponseObject:(id _Nonnull)responseObject;

/**
 待处理的错误信息
 */
- (void)setError:(id _Nonnull)error;

//=============================paramet======================================
/**
 网络请求路径
 */
@property (nonnull,nonatomic,copy) NSString *urlString;

/**
 请求参数
 */
@property (nonnull,nonatomic,strong) NSDictionary *parametDict;

//=============================dataUpload===================================
/**
 上传数据 {uploadName:uploadData}
 */
@property (nonnull,nonatomic,strong) NSArray <PTFetchUploadData *>*uploadDatas;

//=============================block======================================
/**
 请求成功回调
 */
@property (nonatomic,copy) PTFetchBlock succeed;


/**
 请求失败回调
 */
@property (nonatomic,copy) PTFetchBlock failed;

/**
 请求进度
 */
@property (nonatomic,copy) PTFetchBlock progressing;

@end
