//
//  MSBankMcp.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSBankMcp : NSObject
@property (nonatomic,copy) NSString *mcp_id;
/**有效期*/
@property (nonatomic,copy) NSString *mcp_validity_date;
/**银行卡号*/
@property (nonatomic,copy) NSString *mcp_card_no;
/**银行名称*/
@property (nonatomic,copy) NSString *mcp_bank_name;
/**用户名*/
@property (nonatomic,copy) NSString *mcp_user_name;
/**银行logo*/
@property (nonatomic,copy) NSString *mcp_bank_ico;
/*id*/
@property (nonatomic,copy) NSString *mbi_id;

@end
