//
//  MSfastGiveMoneyViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSfastGiveMoneyViewController.h"
#define timeCount 60
#import "MSBankMcp.h"
#import "MSDepositModel.h"
#import "MSCreditCardController.h"
#import "MSXunzeXinYongKaViewController.h"
@interface MSfastGiveMoneyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fuImageView;
@property (weak, nonatomic) IBOutlet UILabel *fuLb;
@property (weak, nonatomic) IBOutlet UIImageView *zhouImgView;
@property (weak, nonatomic) IBOutlet UILabel *shouLb;
@property (weak, nonatomic) IBOutlet UITextField *tixiangLb;
@property (weak, nonatomic) IBOutlet UILabel *zhifuFangshiLb;
@property (weak, nonatomic) IBOutlet UITextField *codeTf;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBt;
@property (weak, nonatomic) IBOutlet UIButton *shoukuanBt;

@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,strong)NSString * credit_card_id;
@property(nonatomic,strong)NSString * debit_card_id;
@property(nonatomic,strong)NSString * order_id;

@end

@implementation MSfastGiveMoneyViewController
- (IBAction)changgeClick:(id)sender {
    WeakSelf(weakSelf)
       MSXunzeXinYongKaViewController *Controller = [[MSXunzeXinYongKaViewController alloc] init];
    Controller.gehuanka = ^(MSBankMcp *bakMcp) {
        [weakSelf.fuImageView sd_setImageWithURL:[NSURL URLWithString:bakMcp.mcp_bank_ico]];
        weakSelf.fuLb.text = bakMcp.mcp_bank_name;
          self.credit_card_id = bakMcp.mcp_id;
    };
    [self.navigationController pushViewController:Controller animated:YES];
    [self.shoukuanBt addTarget:self action:@selector(shoukuanBtClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.codeTf.borderStyle =  self.tixiangLb.borderStyle = UITextBorderStyleNone;
    self.codeTf.placeholder = @"请输入验证码";
    self.tixiangLb.text = @"2000";
    self.navigationItem.title = @"快捷收款";
    NSMutableDictionary * xinyongDict = diction;
      [self.getCodeBt addTarget:self action:@selector(getCodeBtCilck) forControlEvents:UIControlEventTouchUpInside];
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"1";
    dict[@"command"] = @"1006";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
     
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            NSArray *mcps = [MSBankMcp mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"mcp"]];
            if (mcps.count>0) {
                MSBankMcp *bankMcp = [mcps firstObject];
                
                [self.fuImageView sd_setImageWithURL:[NSURL URLWithString:bankMcp.mcp_bank_ico]];
                self.fuLb.text = bankMcp.mcp_bank_name;
                  self.credit_card_id = bankMcp.mcp_id;
            }
        
            
        }
        
    } failure:^(NSError *error) {
        [MBManager hideAlert];
    }];
    
    [self.shoukuanBt gradientFreme:CGRectMake(0, 0, LFscreenW-40, 40) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
    NSMutableDictionary * chuxuDict = diction;
    chuxuDict[@"mcp_card_type"] = @"2";
    chuxuDict[@"command"] = @"1006";
    
    [LFHttpTool post:USER_LOGIN params:chuxuDict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        LFLog(@"%@",responseObj);
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            NSArray *deposits = [MSDepositModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"mcp"]];
            if (deposits.count>0) {
                MSDepositModel *bankMcp = [deposits firstObject];
                [self.zhouImgView sd_setImageWithURL:[NSURL URLWithString:bankMcp.mcp_bank_ico]];
                self.shouLb.text = bankMcp.mcp_bank_name;
                self.debit_card_id = bankMcp.mcp_id;
            }
        }
        
    } failure:^(NSError *error) {
      
        [MBManager hideAlert];
    }];
   
    WeakSelf(weakSelf)
    self.timer = [NSTimer wh_scheduledTimerWithTimeInterval:1 repeats:YES callback:^(NSTimer *timer) {
        [weakSelf timerFireMethod];
    }];
    [self.timer pauseTimer];
    
    
     NSMutableDictionary * zhifuDict = diction;
    zhifuDict[@"command"] = @"2000";
    [YWRequestData publicDict:zhifuDict success:^(id responseObj) {
        NSMutableArray * zhifuFangs = responseObj[@"body"][@"channel_type_list"];
        self.zhifuFangshiLb.text = [zhifuFangs firstObject][@"channel_type_desc"];
       
    }];
}
-(void)getCodeBtCilck{
    self.count = timeCount;
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    if (!self.tixiangLb.text.length) {
        [MBManager showBriefAlert:@"输入提现金额"]; return;
    }
    if ([self.tixiangLb.text integerValue]<550) {
        [MBManager showBriefAlert:@"输入提现金额不能小于550"]; return;
    }


    dic[@"command"] = @"2001";
    dic[@"credit_card_id"] = self.credit_card_id;
    dic[@"debit_card_id"] = self.debit_card_id;
    dic[@"amount"] = [NSString stringWithFormat:@"%@%@",self.tixiangLb.text,@"00"];
    dic[@"channel_type"] = @"1";
    [YWRequestData publicDict:dic success:^(id responseObj) {
         [self.timer resumeTimer];
    }];

    
}
-(void)dealloc{
    [self.timer invalidate];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)timerFireMethod{
    if (self.count<=0){
        self.getCodeBt.userInteractionEnabled = YES;
        self.getCodeBt.selected = NO;
        [self.getCodeBt setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.timer pauseTimer];
    }else{
        self.getCodeBt.selected = YES;
        self.getCodeBt.userInteractionEnabled = NO;
        [self.getCodeBt setTitle:[NSString stringWithFormat:@"(%02ld秒)可重发", self.count-- ] forState:UIControlStateNormal];
    }
    
    
}
-(void)shoukuanBtClick{
    if (!self.tixiangLb.text.length) {
        [MBManager showBriefAlert:@"输入提现金额"]; return;
    }
    if (!self.codeTf.text.length) {
        [MBManager showBriefAlert:@"输入验证码"]; return;
    }
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"command"] = @"2002";
    dic[@"order_id"] = self.order_id;
    dic[@"check_code"] = self.codeTf.text;
   
    [YWRequestData publicDict:dic success:^(id responseObj) {
        [self.timer resumeTimer];
    }];
    
}

@end
