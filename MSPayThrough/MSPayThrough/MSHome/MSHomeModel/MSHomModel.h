//
//  MSHomModel.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSHomModel : NSObject
@property(nonatomic,strong)NSString * qrp_repay_money_finished;
@property(nonatomic,strong)NSString * version;
@property(nonatomic,strong)NSString * mbi_id;
@property(nonatomic,strong)NSString * qrp_repay_count;
@property(nonatomic,strong)NSString * qrp_repay_date;
@property(nonatomic,strong)NSString * qrp_repay_money_fee_total;
@property(nonatomic,strong)NSString * qrp_status;
@property(nonatomic,strong)NSString * qrp_create_time;
@property(nonatomic,strong)NSString * qrp_repay_money_total;
@property(nonatomic,strong)NSString * qrp_repay_day_count;
@property(nonatomic,strong)NSString * qrp_plan_cycle;
@property(nonatomic,strong)NSString * qrp_id;
@property(nonatomic,strong)NSString * qrp_update_time;
@property(nonatomic,strong)NSString * qrp_repay_day;
@property(nonatomic,strong)NSString * qrp_bill_day;
@property(nonatomic,strong)NSString * mbi_code;
@property(nonatomic,strong)NSString * qrp_reserve_money;
@property(nonatomic,strong)NSString * qrp_credit_card_no;
@property(nonatomic,strong)NSString * qrp_repay_money_fee_pay_total;

//
//"" = 3860000,
//"" = 6,
//"" = 300117,
//"" = 4,
//"" = 2018-05-22,2018-05-23,
//"" = 30494,
//"" = 3,
//"" = 2018-05-19 19:22:15,
//"" = 3860000,
//"" = 2,
//"" = 2018-05-22~2018-05-23,
//"" = 100051,
//"" = 2018-05-23 13:00:00,
//"" = 25,
//"" = 07,
//"" = M1805154690350651855,
//"" = 1111694,
//"" = 6225758308116622,
//"" = 400,

@end
@interface MSHomListModel : NSObject
@property(nonatomic,strong)NSString * tm_settlement_time;
@property(nonatomic,strong)NSString * tm_transaction_money_amount;
@property(nonatomic,strong)NSString * tm_transaction_fee_01;
@property(nonatomic,strong)NSString * tm_pwd_situation;
@property(nonatomic,strong)NSString * tm_cs_method;
@property(nonatomic,strong)NSString * tm_transaction_fee_02;
@property(nonatomic,strong)NSString * mbi_code;
@property(nonatomic,strong)NSString * tm_transaction_money;
@property(nonatomic,strong)NSString * tm_create_time;
@property(nonatomic,strong)NSString * tm_sign;
@property(nonatomic,strong)NSString * tm_terminal_type;
@property(nonatomic,strong)NSString * mbi_name;
@property(nonatomic,strong)NSString * tm_serial_no;
@property(nonatomic,strong)NSString * version;
@property(nonatomic,strong)NSString * tm_transaction_type_01;
@property(nonatomic,strong)NSString * tcq_id;
@property(nonatomic,strong)NSString * tm_transaction_type_02;
@property(nonatomic,strong)NSString * tm_card_type;
@property(nonatomic,strong)NSString * tm_trade_time;
@property(nonatomic,strong)NSString * tiq_id;
@property(nonatomic,strong)NSString * tm_remark;
@property(nonatomic,strong)NSString * tm_terminal_num;
@property(nonatomic,strong)NSString * tm_serial_no_bank;
@property(nonatomic,strong)NSString * tm_card_no;
@property(nonatomic,strong)NSString * tm_origin;
@property(nonatomic,strong)NSString * tm_bussiness_time;
@property(nonatomic,strong)NSString * mbi_id;
@property(nonatomic,strong)NSString * tm_transaction_status;
@property(nonatomic,strong)NSString * tm_update_time;

@end
//"" = 2018-05-23 11:10:00,
//"" = 1080900,
//"" = 8608,
//"" = 1,
//"" = 1,
//"" = 0,
//"" = M1805154690350651855,
//"" = 1089508,
//"" = 2018-05-23 11:10:00,
//"" = ,
//"" = 1,
//"" = ,
//"" = 101318051915267289359491,
//"" = 2,
//"" = 13,
//"" = 100004,
//"" = 1,
//"" = 1,
//"" = 2018-05-23 11:10:00,
//"" = 1,
//"" = ,
//"" = ,
//"tm_id" = 65,
//"" = 999125263649492994,
//"" = 6225758308116622,
//"" = 150,
//"" = 2018-05-23 11:10:00,
//"" = 300117,
//"" = 2,
//"" = 2018-05-23 11:10:15,
