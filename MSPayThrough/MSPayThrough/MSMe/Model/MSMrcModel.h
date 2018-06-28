//
//  MSMrcModel.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSMrcModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *mrc_review_status;
@property (nonatomic,copy) NSString *mrc_is_manual_review;
@property (nonatomic,copy) NSString *mrc_update_time;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *mbi_id;
@property (nonatomic,copy) NSString *mrc_risk_level;
@property (nonatomic,copy) NSString *mrc_create_time;
@property (nonatomic,copy) NSString *mrc_review_remark;
@property (nonatomic,copy) NSString *mrc_inner_remark;
@property (nonatomic,copy) NSString *mrc_id;
@property (nonatomic,copy) NSString *mrc_trade_status;

@end
