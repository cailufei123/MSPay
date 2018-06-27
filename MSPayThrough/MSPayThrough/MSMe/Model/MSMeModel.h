//
//  MSMeModel.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSMciModel.h"
#import "MSMbiModel.h"
#import "MSMrcModel.h"

@interface MSMeModel : NSObject
@property (nonatomic,copy) NSString *random_str;
@property (nonatomic,strong) MSMciModel *mci;
@property (nonatomic,strong) MSMbiModel *mbi;
@property (nonatomic,strong) MSMrcModel *mrc;

@end
