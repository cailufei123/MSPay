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

- (void)viewDidLoad {
    [super viewDidLoad];
      NSMutableDictionary * xiangQinDict =diction;
    xiangQinDict[@"command"] = @"3005";
     xiangQinDict[@"qrp_id"] = self.homeModel.qrp_id;
    [YWRequestData xiangQinDict:xiangQinDict success:^(id responseObj) {
        self.datas = [MSHomModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"qrpd_list"]];
    }];
    self.detailsTopView = [MSDetailsTopView loadNameDetailsTopViewXib];
    [self.view addSubview: self.detailsTopView];
}



@end
