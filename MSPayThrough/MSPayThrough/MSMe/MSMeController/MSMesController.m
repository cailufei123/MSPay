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

@interface MSMesController ()

@end

@implementation MSMesController

- (void)viewDidLoad {
    [super viewDidLoad];
   
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
    
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
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
