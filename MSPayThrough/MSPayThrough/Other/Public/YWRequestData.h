//
//  YWRequestData.h
//  PunchTopMasters
//
//  Created by 蔡路飞 on 2018/3/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface YWRequestData : NSObject

//// - 注册用户发送验证码-----
+ (void)registUserSendcodeDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess;
//// - 注册用户-----
+ (void)registUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// - 用户登录-----
+ (void)userLoginDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// -还款计划---
+ (void)playRepaymentDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess;
// -账单---
+ (void)billListDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess;
// -账单-----
+ (void)gongGaoDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess;
+ (void)xiangQinDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess;
+ (void)publicDict:(NSMutableDictionary *)dict success:(void (^) (id responseObj))sucess;
@end
