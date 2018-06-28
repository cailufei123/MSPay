//
//  MSDetalsViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDetalsViewController.h"
#import "MSDetailsTopView.h"
#import "MSHomModel.h"
@interface MSDetalsViewController ()
@property(nonatomic,strong)NSMutableArray * datas;
@property(nonatomic,strong)MSDetailsTopView * detailsTopView;
@end

@implementation MSDetalsViewController
- (void)viewWillAppear:(BOOL)animated {
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"计划详情";
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:naverTextColor}];
    self.automaticallyAdjustsScrollViewInsets = NO;
      NSMutableDictionary * xiangQinDict =diction;
    xiangQinDict[@"command"] = @"3005";
     xiangQinDict[@"qrp_id"] = self.homeModel.qrp_id;
    [YWRequestData xiangQinDict:xiangQinDict success:^(id responseObj) {
        self.datas = [MSHomModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"qrpd_list"]];
    }];
    self.detailsTopView = [MSDetailsTopView loadNameDetailsTopViewXib];
    self.detailsTopView .clf_width = LFscreenW;
    [self.view addSubview: self.detailsTopView];
    self.view.backgroundColor = [UIColor orangeColor];
    self.detailsTopView.homeModel = self.homeModel;
    
  
}



@end
