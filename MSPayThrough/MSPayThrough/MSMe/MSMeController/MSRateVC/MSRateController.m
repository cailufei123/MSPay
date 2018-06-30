//
//  MSRateController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSRateController.h"

@interface MSRateController ()
//积分
@property (weak, nonatomic) IBOutlet UILabel *jiFenLabel;
//还款
@property (weak, nonatomic) IBOutlet UILabel *backPayLabel;

@property (weak, nonatomic) IBOutlet UILabel *kuaiJieLabel;
@property (weak, nonatomic) IBOutlet UILabel *huanKuanLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;

@end

@implementation MSRateController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (ABOVE_IOS11) {
        self.topViewY.constant = 15;
    }else{
        self.topViewY.constant = 79;
    }
    self.navigationItem.title = @"费率";
    //请求费率接口
    [self loadFeiLvData];
}

- (void)loadFeiLvData{
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"1005";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"费率-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
//            self.kuaiJieLabel.text = responseObj[@"body"][@""fee_list" = 2"]
            
        }else{
            
            
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

@end
