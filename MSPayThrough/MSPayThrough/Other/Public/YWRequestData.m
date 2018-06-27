//
//  YWRequestData.m
//  PunchTopMasters
//
//  Created by 蔡路飞 on 2018/3/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "YWRequestData.h"

@implementation YWRequestData



#pragma mark - 注册用户-----
+ (void)registUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:USER_REGISTER params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

#pragma mark - 用户登录-----

+ (void)userLoginDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess{
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        sucess(responseObj);
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
#pragma mark - 还款计划-----
+ (void)playRepaymentDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess{
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        sucess(responseObj);
        
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

#pragma mark -账单-----
+ (void)billListDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:nil params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        sucess(responseObj);
        
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
@end
