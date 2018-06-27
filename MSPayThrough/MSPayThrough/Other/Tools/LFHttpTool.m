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


+(NSString *)stringWithDict:(NSDictionary*)dict{
    
    NSArray*keys = [dict allKeys];
    
    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
        return[obj1 compare:obj2 options:NSNumericSearch];//正序
    }];
    
    NSString*str =@"";
    
    for(NSString*categoryId in sortedArray) {
        
        id value = [dict objectForKey:categoryId];
        
        if([value isKindOfClass:[NSDictionary class]]) {
            
            value = [self stringWithDict:value];
            
        }
        
        if([str length] !=0) {
            
            str = [str stringByAppendingString:@","];
            
        }
        
        str = [str stringByAppendingFormat:@"%@",value];
        
    }
    NSLog(@"str:%@",str);
    return str;
}
+ (void)post:(NSString *)url params:(NSMutableDictionary *)params progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    
    
    params[@"random_str"] =  @"pyMsM1KWivb2zNrd9PEIduGtzTau8VxT";
    
    // 1.获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary * allDict = diction;
    NSMutableDictionary * headDict = diction;
    
    NSMutableDictionary * dict = diction;
    NSMutableArray * array = [NSMutableArray array];
    
    
    headDict[@"version"] =   [LFHttpTool getAppVersion];
    headDict[@"channel"] =  @"1";;
    headDict[@"merchant_id"] = loginerchant_id;
    headDict[@"format"] =  @"JSON";
    headDict[@"charset"] =  @"utf-8";
    headDict[@"sign_type"] =  @"MD5";
    headDict[@"timestamp"] =  [LFHttpTool currentTimeStr];
    headDict[@"command"] =  params[@"command"];
    [params removeObjectForKey:@"command"];
    
    //    headDict[@"sign"] =   [[NSString stringWithFormat:@"%@%@",[params mj_JSONString],loginMerchant_key] toMD5];
    dict[@"head"] = headDict;
    dict[@"body"] = params;
    headDict[@"sign"] =   [[NSString stringWithFormat:@"%@%@%@%@",@"0",@"pyMsM1KWivb2zNrd9PEIduGtzTau8VxT",@"200",loginMerchant_key] toMD5];
    headDict[@"sign"] =   [[NSString stringWithFormat:@"%@%@", [[LFHttpTool stringWithDict:params] stringByReplacingOccurrencesOfString:@"," withString:@""],loginMerchant_key] toMD5];
    
    allDict[@"jsondata"] = [dict mj_JSONString];
    
    
    [LFHttpTool stringWithDict:params];
    NSString * stri = [array componentsJoinedByString:@""];
    
    manager.securityPolicy =   [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    
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


