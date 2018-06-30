//
//  MSMesController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSMesController.h"
#import "MSUserController.h"
#import "MSCardController.h"
#import "MSSetController.h"
#import "MSAboutController.h"
#import "MSMeModel.h"
#import "MSBankController.h"
#import "MSRateController.h"
#import "MSNticeController.h"
#import "YCArchiveTool.h"
#import "MSAboutController.h"
#import "MSShareController.h"
#import "WRNavigationBar.h"

@interface MSMesController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;

@property (nonatomic,strong) NSMutableArray *bankLists;

//个人信息模型
@property (nonatomic,strong) MSMeModel *meModel;
@end

@implementation MSMesController

- (NSMutableArray *)bankLists{
    if (!_bankLists) {
        _bankLists = [NSMutableArray array];
    }
    return _bankLists;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // 设置初始导航栏透明度
//    [self wr_setNavBarBackgroundAlpha:0];
//    // 一行代码搞定导航栏底部分割线是否隐藏
//    [self wr_setNavBarShadowImageHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.backImageView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
    //获取用户信息
    [self loadUserInfo];
    
    //获取银行卡列表
    [self loadBankList];
    
}

- (void)loadBankList{
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"99";
    dict[@"command"] = @"1006";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
//        LFLog(@"银行卡列表-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [self.bankLists removeAllObjects];
            NSArray *bankLists = responseObj[@"body"][@"mcp"];
            [self.bankLists addObjectsFromArray:bankLists];
        }
        
    } failure:^(NSError *error) {

        [MBManager hideAlert];
    }];
}

- (void)loadUserInfo{
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"1003";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
        
    } success:^(id responseObj) {
        
        LFLog(@"个人信息-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
           
            self.meModel = [MSMeModel mj_objectWithKeyValues:responseObj[@"body"]];
            [YCArchiveTool saveMeModel:self.meModel];
            
            self.userNameLabel.text = self.meModel.mci.mci_name;
            self.IDLabel.text = [NSString stringWithFormat:@"ID:%@",self.meModel.mbi.mbi_id];
            
            
        }else{
//            [MBManager showBriefAlert:@"绑定失败"];

        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}


//点击头像
- (IBAction)clicTopBtn {
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSUserController *userVC = [[MSUserController alloc] init];
        [self.navigationController pushViewController:userVC animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
   
}
//点击费率
- (IBAction)clickFeiLvBtn {
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSRateController *rateVc = [[MSRateController alloc] init];
        [self.navigationController pushViewController:rateVc animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
    
}
//点击银行卡
- (IBAction)clickBankBtn {
    
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSBankController *bankVc = [[MSBankController alloc] init];
        [self.navigationController pushViewController:bankVc animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
   
}
//点击公告
- (IBAction)clickGongGaoBtn {
    
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSNticeController *noticeVc = [[MSNticeController alloc] init];
        [self.navigationController pushViewController:noticeVc animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
  
}
//点击分享
- (IBAction)clickShareBtn {
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSShareController *sharVc = [[MSShareController alloc] init];
        [self.navigationController pushViewController:sharVc animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
   
}
//点击会员
- (IBAction)clickVipBtn {
    
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSUserController *cardVc = [[MSUserController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
  
}
//点击客服
- (IBAction)clickKeFuBtn {
   
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
        MSAboutController *aboutVc = [[MSAboutController alloc] init];
        [self.navigationController pushViewController:aboutVc animated:YES];
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        [self.navigationController pushViewController:cardVc animated:YES];
    }
   
}
//点击设置
- (IBAction)clickSetBtn {
    
    MSSetController *setVc = [[MSSetController alloc] init];
    [self.navigationController pushViewController:setVc animated:YES];
   
}


@end
