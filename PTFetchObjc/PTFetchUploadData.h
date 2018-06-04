//
//  PTFetchUploadData.h
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//
/*
 创建人：OComme
 功能描述：上传的数据
 所处位置：
 创建版本：V 0.0.1
 --修改人：
 修改版本：
 修改描述：
 */

#import <Foundation/Foundation.h>

@interface PTFetchUploadData : NSObject

/**
 上传数据
 */
@property (nonnull,nonatomic,strong) NSData *uploadData;

/**
 上传文件名（参数）
 */
@property (nonnull,nonatomic,copy) NSString *uploadName;

/**
 文件拓展名（例如png、jpeg、gif、tiff等）
 */
@property (nonnull,nonatomic,copy) NSString *contentType;

/**
 类型名（例如image`/`*等）
 */
@property (nonnull,nonatomic,copy) NSString *mimeType;


@end
