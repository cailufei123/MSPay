//
//  MSAboutController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSAboutController.h"

@interface MSAboutController ()
//公司名称
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
//电话
@property (weak, nonatomic) IBOutlet UILabel *phoneLabe;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;

@end

@implementation MSAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (ABOVE_IOS11) {
        self.topViewY.constant = 50;
    }else{
        self.topViewY.constant = 114;
    }
     self.navigationItem.title = @"谊付通";
    
    //关于我们
    [self loadAboutData];
}

- (void)loadAboutData{
    NSMutableDictionary * dict = diction;
    dict[@"abi_code"] = @"n999999";
    dict[@"command"] = @"99008";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"responseObj-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            if ([responseObj[@"body"][@"cau_list"] count] > 1) {
                self.phoneLabe.text = responseObj[@"body"][@"cau_list"][1][@"cau_value"];
            }
            
        }else{
           

        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

@end
