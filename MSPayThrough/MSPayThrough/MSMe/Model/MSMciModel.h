//
//  MSMciModel.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSMciModel : NSObject
@property (nonatomic,copy) NSString *mci_salt;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *mbi_id;
@property (nonatomic,copy) NSString *mci_id_card;
@property (nonatomic,copy) NSString *mci_email;
@property (nonatomic,copy) NSString *mci_create_time;
@property (nonatomic,copy) NSString *mci_update_time;
@property (nonatomic,copy) NSString *mci_id;
@property (nonatomic,copy) NSString *mci_period_of_validity;
@property (nonatomic,copy) NSString *mbi_code;
@property (nonatomic,copy) NSString *mci_mobile_phone;
@property (nonatomic,copy) NSString *mci_sign_org_name;
@property (nonatomic,copy) NSString *mci_login_pwd;
@end
