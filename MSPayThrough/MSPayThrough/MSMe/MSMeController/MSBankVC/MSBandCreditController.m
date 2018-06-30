//
//  MSBandCreditController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSBandCreditController.h"
#import "MSBankController.h"

@interface MSBandCreditController ()
@property (weak, nonatomic) IBOutlet UITextField *zhangdanLabel;
@property (weak, nonatomic) IBOutlet UITextField *huanKuanLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;

@end

@implementation MSBandCreditController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (ABOVE_IOS11) {
        self.topViewY.constant = 15;
    }else{
        self.topViewY.constant = 79;
    }
    self.navigationItem.title = @"添加信用卡";
     [self.addButton gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
- (IBAction)clickAddButton {
    
    if (self.zhangdanLabel.text.length==0) {
        [MBManager showBriefAlert:@"请输入账单日"];
        return;
    }
    if (self.huanKuanLabel.text.length==0) {
        [MBManager showBriefAlert:@"请选择还款日"];
        return;
    }
    if (self.phoneLabel.text.length==0) {
        [MBManager showBriefAlert:@"手机号"];
        return;
    }
    
    if (![self.phoneLabel.text isMobileNumber]) {
        [MBManager showBriefAlert:@"请输入正确的手机号"];
        return;
    }
    
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"1";
    dict[@"mcp_main"] = @"999999";
    dict[@"mcp_card_no"] = self.bankNumStr;
    dict[@"mcp_validity_date"] = self.bankZhengStr;
    dict[@"mcp_cvv"] = self.bankLastStr;
    dict[@"mcp_bank_sub_name"] = self.faBankNumStr;
    dict[@"mcp_bill_date"] = self.zhangdanLabel.text;
    dict[@"mcp_repayment_date"] = self.huanKuanLabel.text;
    dict[@"mcp_mobile"] = self.phoneLabel.text;
    
    dict[@"mcp_user_name"] = [YCArchiveTool meModel].mci.mci_name;
    dict[@"mcp_user_id_card"] = @"999999";
    dict[@"mcp_bank_name"] = self.faBankNumStr;
    dict[@"mcp_bank_code"] = @"999999";
    dict[@"mcp_bank_abbr"] = @"999999";
    dict[@"mcp_bank_sub_no"] = @"999999";
    dict[@"mcp_province_code"] = @"999999";
    dict[@"mcp_city_code"] = @"999999";
    
    dict[@"command"] = @"1009";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"信用卡-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [MBManager showBriefAlert:@"添加信用卡成功"];
            
            [self back];
        }
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}

- (void)back{
    
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[MSBankController class]]) {
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}

@end
