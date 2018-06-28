//
//  MSMbiModel.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSMbiModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *mbi_business_licence;
@property (nonatomic,copy) NSString *mbi_vip_level;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *mbi_id;
@property (nonatomic,copy) NSString *abi_id;
@property (nonatomic,copy) NSString *mbi_type;
@property (nonatomic,copy) NSString *mbi_name;
@property (nonatomic,copy) NSString *mbi_phone;
@property (nonatomic,copy) NSString *mbi_code;
@property (nonatomic,copy) NSString *abi_code;
@property (nonatomic,copy) NSString *mbi_register_time;
@property (nonatomic,copy) NSString *mbi_update_time;

@end
