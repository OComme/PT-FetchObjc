# PT-FetchObjc

`PT-FetchObjc`是 `PTFetch`的 `Objective-C`版本，也是对其的优化

本质上是基于面向接口的思想，对 [AFNetworking](https://github.com/AFNetworking/AFNetworking) 的二次封装。

# PTFetchModel

作为数据请求配置模型，所有在HTTP请求中需要的参数和回调都在这里配置。

它不能被直接使用，需创建其子类，遵循`PTFetchProtocol`协议的方法，以此作为请求模型的定制。

```Objective-C
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
```

# PTFetchManager

作为请求的主体对象，使用`PTFetchModel`进行数据请求

```Objective-C

+ (void)Fetch_POSTData:(PTFetchModel *)fetchModel;

+ (void)Fetch_GETData:(PTFetchModel *)fetchModel;

+ (void)Fetch_DELETEData:(PTFetchModel *)fetchModel;

+ (void)Fetch_PUTData:(PTFetchModel *)fetchModel;

//+ (void)Fetch_HEADData:(PTFetchModel *)fetchModel;

+ (void)Fetch_PATCHData:(PTFetchModel *)fetchModel;

+ (void)Fetch_UPLOADData:(PTFetchModel *)fetchModel;

```

如果你想要将这个工具导入你的项目 请使用

`pod 'PTFetchObjc', :git=> 'https://github.com/OComme/PT-FetchObjc'`
