//
//  YCArchiveTool.h
//  JapanVillage
//
//  Created by ribencun on 2018/3/22.
//  Copyright © 2018年 ribencun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSMeModel.h"

@interface YCArchiveTool : NSObject

/**
 *  存储个人信息
 */
+ (void)saveMeModel:(MSMeModel *)meModel;

/**
 *  读取个人信息
 */
+ (MSMeModel *)meModel;


@end
