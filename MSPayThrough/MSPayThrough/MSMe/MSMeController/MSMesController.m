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

@interface MSMesController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;

//个人信息模型
@property (nonatomic,strong) MSMeModel *meModel;
@end

@implementation MSMesController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.backImageView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
    //获取用户信息
    [self loadUserInfo];
    
}

- (void)loadUserInfo{
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"1003";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
        
    } success:^(id responseObj) {
        
        LFLog(@"个人信息-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
           
            self.meModel = [MSMeModel mj_objectWithKeyValues:responseObj[@"body"]];
            
            self.userNameLabel.text = self.meModel.mbi.mbi_name;
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
    
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击费率
- (IBAction)clickFeiLvBtn {
    
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击银行卡
- (IBAction)clickBankBtn {
    
//    MSCardController *cardVc = [[MSCardController alloc] init];
//    [self.navigationController pushViewController:cardVc animated:YES];
    MSBankController *bankVc = [[MSBankController alloc] init];
    [self.navigationController pushViewController:bankVc animated:YES];
}
//点击公告
- (IBAction)clickGongGaoBtn {
    
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击分享
- (IBAction)clickShareBtn {
    
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击会员
- (IBAction)clickVipBtn {
    
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击客服
- (IBAction)clickKeFuBtn {
   
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击设置
- (IBAction)clickSetBtn {
    
    MSSetController *setVc = [[MSSetController alloc] init];
    [self.navigationController pushViewController:setVc animated:YES];
   
}


@end
