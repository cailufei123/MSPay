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

@end

@implementation MSAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title = @"谊付通";
    
    //关于我们
    [self loadAboutData];
}

- (void)loadAboutData{
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"99008";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"responseObj-%@",responseObj);
        
//        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
//            [MBManager showscuess:@"绑定成功"];
//            [self.navigationController popViewControllerAnimated:YES];
//        }else{
//            [MBManager showBriefAlert:@"绑定失败"];
//
//        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

@end
