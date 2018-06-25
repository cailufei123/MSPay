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

+ (void)post:(NSString *)url params:(NSDictionary *)params progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    NSString *uuid = [[NSUUID UUID] UUIDString];
    // 开始设置请求头
//    NSString *oldVersion = [LFHttpTool getAppVersion];
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *minorVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    NSString * oldVersionNmb = [minorVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    

    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:idfv forHTTPHeaderField:@"uid"];
    [manager.requestSerializer setValue:oldVersionNmb forHTTPHeaderField:@"vc"];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
  
    [manager POST:SERVER_ADDR parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
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



@end
