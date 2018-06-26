//
//  LFHttpTool.m
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/17.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import "LFHttpTool.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import <UIKit/UIKitDefines.h>
@implementation LFHttpTool
+ (void)get:(NSString *)url params:(NSDictionary *)params progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
       // 2.发送GET请求
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downloadProgress) {
             progress(downloadProgress);
        }
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
             success(responseObject);
        }

       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
           failure(error);
        }
        

    }];
    
}
//+(instancetype)share{
//    
//    static NetWorkingManager *instance;
//    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        
//           NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//          //1.实例化
//       instance = [[NetWorkingManager alloc] initWithSessionConfiguration:config];
//        
//           //2.可接受的格式
//        
//           instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",     @"text/json", @"text/javascript", @"text/html", nil];
//        
//    });
//    
//    return instance;
//    
//}


+ (void)post:(NSString *)url params:(NSDictionary *)params progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    
   
    
    
    // 1.获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  NSMutableDictionary * allDict = diction;
     NSMutableDictionary * headDict = diction;
  
     NSMutableDictionary * dict = diction;
   
   

    headDict[@"version"] =   [LFHttpTool getAppVersion];
    headDict[@"channel"] =  @"1";;
    headDict[@"merchant_id"] = loginUid;
    headDict[@"format"] =  @"JSON";
    headDict[@"charset"] =  @"utf-8";
    headDict[@"sign_type"] =  @"MD5";
    headDict[@"timestamp"] =  [LFHttpTool currentTimeStr];
    headDict[@"command"] =  params[@"command"];
    headDict[@"sign"] =   [[NSString stringWithFormat:@"%@%@",[params mj_JSONString],loginUid] toMD5];
    dict[@"head"] = headDict;
    dict[@"body"] = params;
    allDict[@"jsondata"] = [dict mj_JSONString];
    


    manager.securityPolicy =   [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
     [manager.securityPolicy setValidatesDomainName:NO];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
     LFLog(@"%@", allDict);
   
    [manager POST:SERVER_ADDR parameters: allDict progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downloadProgress) {
            progress(downloadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
            LFLog(@"%@",error);
        }

    }];
}
////https证书
//+ (AFSecurityPolicy*)customSecurityPolicy
//{
//    // /先导入证书
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"hd1.graland.com" ofType:@"cer"];//证书的路径
//    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
//
//    // AFSSLPinningModeCertificate 使用证书验证模式
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//
//    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
//    // 如果是需要验证自建证书，需要设置为YES
//
//    securityPolicy.allowInvalidCertificates = YES;
//    securityPolicy.validatesDomainName = YES;
//
//    securityPolicy.pinnedCertificates = [NSSet setWithObject:certData];
//
//    return securityPolicy;
//}

















- (NSMutableDictionary *)serializeObject:(id)theObject
{
    NSString *className = NSStringFromClass([theObject class]);
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList(theClass, &outCount);
    
    NSMutableArray *propertyNames = [[NSMutableArray alloc] initWithCapacity:1];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyNameString = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [propertyNames addObject:propertyNameString];
        
        
        NSLog(@"%s %s\n", property_getName(property), property_getAttributes(property));
        
    }
    
    NSMutableDictionary *finalDict = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    for(NSString *key in propertyNames)
    {
        SEL selector = NSSelectorFromString(key);
        id value = [theObject performSelector:selector];
        
        if (value == nil)
        {
            value = [NSNull null];
        }
        
        [finalDict setObject:value forKey:key];
    }
    
    return finalDict;
    
}
+ (NSString *)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *minorVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return minorVersion;
}
+ (NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

@end
