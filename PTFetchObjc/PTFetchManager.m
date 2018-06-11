//
//  PTFetchManager.m
//  PT-FetchObjcDemo
//
//  Created by BlanBok on 2018/6/4.
//  Copyright © 2018年 OComme. All rights reserved.
//

#import "PTFetchManager.h"
#import "AFNetworking.h"

@interface PTFetchManager ()

/**
 HTTP会话管理
 */
@property (nonnull,nonatomic,strong) AFHTTPSessionManager *sessionManager;

@end

@implementation PTFetchManager

+ (PTFetchManager *)sharedPTFetchManager
{
    static PTFetchManager *dataManager = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        dataManager = [[self allocWithZone:NULL] init] ;
    });
    return dataManager;
}

#pragma mark-API
+ (void)Fetch_POSTData:(PTFetchModel *)fetchModel
{
    [[self sharedPTFetchManager].sessionManager POST:fetchModel.urlString parameters:fetchModel.parametDict progress:fetchModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

+ (void)Fetch_GETData:(PTFetchModel *)fetchModel
{
    [[self sharedPTFetchManager].sessionManager GET:fetchModel.urlString parameters:fetchModel.parametDict progress:fetchModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

+ (void)Fetch_DELETEData:(PTFetchModel *)fetchModel
{
    [[self sharedPTFetchManager].sessionManager DELETE:fetchModel.urlString parameters:fetchModel.parametDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

+ (void)Fetch_PUTData:(PTFetchModel *)fetchModel
{
    [[self sharedPTFetchManager].sessionManager PUT:fetchModel.urlString parameters:fetchModel.parametDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

//+ (void)Fetch_HEADData:(PTFetchModel *)fetchModel
//{
//    [[self sharedPTFetchManager].sessionManager HEAD:fetchModel.urlString parameters:fetchModel.parametDict success:^(NSURLSessionDataTask * _Nonnull task) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//}

+ (void)Fetch_PATCHData:(PTFetchModel *)fetchModel
{
    [[self sharedPTFetchManager].sessionManager PATCH:fetchModel.urlString parameters:fetchModel.parametDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
}

+ (void)Fetch_UPLOADData:(PTFetchModel *)fetchModel
{
    NSAssert(fetchModel.uploadDatas, @"uploadData can not be nil");
    
    [[self sharedPTFetchManager].sessionManager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    
    [[self sharedPTFetchManager].sessionManager POST:fetchModel.urlString parameters:fetchModel.parametDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (PTFetchUploadData *data in fetchModel.uploadDatas) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.%@", str,data.contentType];
            [formData appendPartWithFileData:data.uploadData name:data.uploadName fileName:fileName mimeType:data.mimeType];
        }
    } progress:fetchModel.progressing success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        fetchModel.responseObject = responseObject;\
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fetchModel.error = error;
    }];
    
}

#pragma mark-lazyload
- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 10;
    }
    return _sessionManager;
}

@end
