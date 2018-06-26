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

@interface MSMesController ()

@end

@implementation MSMesController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

//点击头像
- (IBAction)clicTopBtn {
    NSLog(@"头像");
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击费率
- (IBAction)clickFeiLvBtn {
    NSLog(@"费率");
}
//点击银行卡
- (IBAction)clickBankBtn {
    NSLog(@"银行卡");
}
//点击公告
- (IBAction)clickGongGaoBtn {
    NSLog(@"公告");
}
//点击分享
- (IBAction)clickShareBtn {
    NSLog(@"分享");
}
//点击会员
- (IBAction)clickVipBtn {
    NSLog(@"会员");
}
//点击客服
- (IBAction)clickKeFuBtn {
    NSLog(@"客服");
}
//点击设置
- (IBAction)clickSetBtn {
    NSLog(@"设置");
}


@end
