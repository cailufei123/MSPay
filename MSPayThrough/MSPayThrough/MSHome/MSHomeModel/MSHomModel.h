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

@interface GongGaoModel : NSObject
@property(nonatomic,strong)NSString * cn_title;
@property(nonatomic,strong)NSString * cn_content;
@property(nonatomic,strong)NSString * cn_create_time;
@end

