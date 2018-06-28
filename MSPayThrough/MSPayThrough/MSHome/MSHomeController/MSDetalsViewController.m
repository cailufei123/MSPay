//
//  MSDetalsViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDetalsViewController.h"
#import "MSDetailsTopView.h"
@interface MSDetalsViewController ()

@end

@implementation MSDetalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      NSMutableDictionary * xiangQinDict =diction;
    xiangQinDict[@"command"] = @"3005";
     xiangQinDict[@"qrp_id"] = self.homeModel.qrp_id;
    [YWRequestData xiangQinDict:xiangQinDict success:^(id responseObj) {
        
    }];
}



@end
