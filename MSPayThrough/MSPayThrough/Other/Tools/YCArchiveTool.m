//
//  YCArchiveTool.m
//  JapanVillage
//
//  Created by ribencun on 2018/3/22.
//  Copyright © 2018年 ribencun. All rights reserved.
//

#import "YCArchiveTool.h"


//个人信息
#define MSPersonInfoFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"MSPersonInfo.data"]

@implementation YCArchiveTool

/**
 *  存储个人信息
 */
+ (void)saveMeModel:(MSMeModel *)meModel{
    // 归档
    [NSKeyedArchiver archiveRootObject:meModel toFile:MSPersonInfoFilepath];
}

/**
 *  读取个人信息
 */
+ (MSMeModel *)meModel{
    // 读取帐号
    MSMeModel *meModel = [NSKeyedUnarchiver unarchiveObjectWithFile:MSPersonInfoFilepath];
    return meModel;
}


@end
