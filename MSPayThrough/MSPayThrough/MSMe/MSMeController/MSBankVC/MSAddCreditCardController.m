//
//  MSAddCreditCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSAddCreditCardController.h"
#import "BRPickerView.h"
#import "MSBankList.h"
#import "MSBandCreditController.h"

@interface MSAddCreditCardController ()
//用户
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//身份证号
@property (weak, nonatomic) IBOutlet UILabel *cardNumLabel;
//卡号
@property (weak, nonatomic) IBOutlet UITextField *bankNumTF;
//发卡行
@property (weak, nonatomic) IBOutlet UITextField *faBankNumTF;
//卡正面
@property (weak, nonatomic) IBOutlet UITextField *bankZhengTF;
//卡末三位
@property (weak, nonatomic) IBOutlet UITextField *bankLastTF;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic,strong) NSMutableArray *bankLists;
@end

@implementation MSAddCreditCardController

- (NSMutableArray *)bankLists{
    if (!_bankLists) {
        _bankLists = [NSMutableArray array];
    }
    return _bankLists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"添加信用卡";
    [self.nextBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    self.userNameLabel.text = [YCArchiveTool meModel].mci.mci_name;
    self.cardNumLabel.text = [YCArchiveTool meModel].mci.mci_id_card;
    
   
}

//点击发卡行
- (IBAction)clickFaKaBank {
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"99002";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
//        LFLog(@"银行卡-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            NSArray *bankLists = [MSBankList mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"dict_bank_list"]];
            [self.bankLists removeAllObjects];
            for (MSBankList *bankList in bankLists) {
                [self.bankLists addObject:bankList.db_name];
            }
            __weak typeof(self) weakSelf = self;
            [BRStringPickerView showStringPickerWithTitle:@"选择银行卡" dataSource:self.bankLists defaultSelValue:weakSelf.faBankNumTF.text resultBlock:^(id selectValue) {
                weakSelf.faBankNumTF.text = selectValue;
                
            }];
        }
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}

//点击相机
- (IBAction)clickCameraBtn {
}

- (IBAction)clickNextBtn {
    //添加银卡卡

    if (self.bankNumTF.text.length==0) {
        [MBManager showBriefAlert:@"请输入卡号"];
        return;
    }
    if (self.faBankNumTF.text.length==0) {
        [MBManager showBriefAlert:@"请选择发卡行"];
        return;
    }
    if (self.bankZhengTF.text.length==0) {
        [MBManager showBriefAlert:@"请输入卡面有效期,如06/21，输入0621"];
        return;
    }
    if (self.bankLastTF.text.length==0) {
        [MBManager showBriefAlert:@"卡背面末三位数字"];
        return;
    }
    
    MSBandCreditController *bandVC = [[MSBandCreditController alloc] init];

    bandVC.bankNumStr = self.bankNumTF.text;
    bandVC.faBankNumStr = self.faBankNumTF.text;
    bandVC.bankZhengStr = self.bankZhengTF.text;
    bandVC.bankLastStr = self.bankLastTF.text;
    [self.navigationController pushViewController:bandVC animated:YES];
}

@end
