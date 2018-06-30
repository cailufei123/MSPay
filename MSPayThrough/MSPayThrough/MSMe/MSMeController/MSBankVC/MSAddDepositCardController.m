//
//  MSAddDepositCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSAddDepositCardController.h"
#import "BRPickerView.h"
#import "MSBankList.h"
#import <AipOcrSdk/AipOcrSdk.h>

@interface MSAddDepositCardController ()
//用户
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//身份证号
@property (weak, nonatomic) IBOutlet UILabel *cardNumLabel;
//卡号
@property (weak, nonatomic) IBOutlet UITextField *bankNumTF;
//发卡行
@property (weak, nonatomic) IBOutlet UITextField *faBankNumTF;
//手机号
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;
@property (nonatomic,strong) NSMutableArray *bankLists;

@property (nonatomic,strong) NSMutableArray *allBankLists;

@property (nonatomic,assign) NSInteger selectRow;
@end

@implementation MSAddDepositCardController{
    // 默认的识别成功的回调
    void (^_successHandler)(id);
    // 默认的识别失败的回调
    void (^_failHandler)(NSError *);
}

- (NSMutableArray *)allBankLists{
    if (!_allBankLists) {
        _allBankLists = [NSMutableArray array];
    }
    return _allBankLists;
}
- (NSMutableArray *)bankLists{
    if (!_bankLists) {
        _bankLists = [NSMutableArray array];
    }
    return _bankLists;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (ABOVE_IOS11) {
        self.topViewY.constant = 15;
    }else{
        self.topViewY.constant = 79;
    }
    self.navigationItem.title = @"添加储蓄卡";
    [self.nextBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
     [[AipOcrService shardService] authWithAK:@"DQTKbF9xL5UFGxLgeDEtwpTX" andSK:@"SME24jkuQ5X0xzBLarSTMln3iApIAkmP"];
    [self configCallback];
    
    self.userNameLabel.text = [YCArchiveTool meModel].mci.mci_name;
    self.cardNumLabel.text = [YCArchiveTool meModel].mci.mci_id_card;
}

- (void)configCallback {
    __weak typeof(self) weakSelf = self;
    
    // 这是默认的识别成功的回调
    _successHandler = ^(id result){
        LFLog(@"result-%@", result);
        
        if(result[@"result"]){
            
            [weakSelf.bankNumTF becomeFirstResponder];
            weakSelf.bankNumTF.text = [NSString stringWithFormat:@"%@",result[@"result"][@"bank_card_number"]];
            
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }];
    };
    
    _failHandler = ^(NSError *error){
        NSLog(@"%@", error);
        NSString *msg = [NSString stringWithFormat:@"%li:%@", (long)[error code], [error localizedDescription]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [MBManager showBriefAlert:@"识别失败"];
        }];
    };
}
//点击相机
- (IBAction)clickCameraBtn {
    UIViewController * vc =
    [AipCaptureCardVC ViewControllerWithCardType:CardTypeBankCard
                                 andImageHandler:^(UIImage *image) {
                                     
                                     [[AipOcrService shardService] detectBankCardFromImage:image
                                                                            successHandler:_successHandler
                                                                               failHandler:_failHandler];
                                     
                                 }];
    [self presentViewController:vc animated:YES completion:nil];

}
//点击发卡行
- (IBAction)clickFaKaBankBtn {
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"99002";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
//        LFLog(@"获取银行卡列表-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [self.allBankLists removeAllObjects];
            
            NSArray *bankLists = [MSBankList mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"dict_bank_list"]];
            [self.allBankLists addObjectsFromArray:bankLists];
            [self.bankLists removeAllObjects];
            for (MSBankList *bankList in bankLists) {
                [self.bankLists addObject:bankList.db_name];
            }
            __weak typeof(self) weakSelf = self;
            [BRStringPickerView showStringPickerWithTitle:@"选择银行卡" dataSource:self.bankLists defaultSelValue:weakSelf.faBankNumTF.text resultBlock:^(id selectValue,NSInteger selectRow) {
                weakSelf.faBankNumTF.text = selectValue;
                self.selectRow = selectRow;
                
            }];
        }
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}

- (IBAction)clickNextBtn {
    
    MSBankList *bankList = self.allBankLists[self.selectRow];
    
    if (self.bankNumTF.text.length==0) {
        [MBManager showBriefAlert:@"请输入卡号"];
        return;
    }
    if (self.faBankNumTF.text.length==0) {
        [MBManager showBriefAlert:@"请选择发卡行"];
        return;
    }
    if (self.phoneTF.text.length==0) {
        [MBManager showBriefAlert:@"手机号"];
        return;
    }
    
    if (![self.phoneTF.text isMobileNumber]) {
        [MBManager showBriefAlert:@"请输入正确的手机号"];
        return;
    }
  
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"2";
    dict[@"mcp_main"] = @"2";
    dict[@"mcp_card_no"] = self.bankNumTF.text;
    dict[@"mcp_validity_date"] = @"999999";
    dict[@"mcp_cvv"] = @"999999";
    dict[@"mcp_bank_sub_name"] = self.faBankNumTF.text;
    dict[@"mcp_bill_date"] = @"999999";
    dict[@"mcp_repayment_date"] = @"999999";
    dict[@"mcp_mobile"] = self.phoneTF.text;

    dict[@"mcp_user_name"] = [YCArchiveTool meModel].mci.mci_name;
    dict[@"mcp_user_id_card"] = @"999999";
    dict[@"mcp_bank_name"] = self.faBankNumTF.text;
    dict[@"mcp_bank_code"] = @"999999";
    dict[@"mcp_bank_abbr"] = bankList.db_code_en;
    dict[@"mcp_bank_sub_no"] = @"999999";
    dict[@"mcp_province_code"] = @"999999";
    dict[@"mcp_city_code"] = @"999999";

    dict[@"command"] = @"1009";

    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {

    } success:^(id responseObj) {

        LFLog(@"信用卡-%@",responseObj);

        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [MBManager showBriefAlert:@"添加储蓄卡成功"];

            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {

        [MBManager hideAlert];
    }];
}


@end
