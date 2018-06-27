//
//  MSVerifyCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSVerifyCardController.h"

@interface MSVerifyCardController ()
/**
持卡人
 */
@property (weak, nonatomic) IBOutlet UITextField *cardTF;
/**
 身份证
 */
@property (weak, nonatomic) IBOutlet UITextField *cardNumTF;
/**
签发机关
 */
@property (weak, nonatomic) IBOutlet UITextField *bodyTF;
/**
 有效期
 */
@property (weak, nonatomic) IBOutlet UITextField *timeTF;
//提交按钮
@property (weak, nonatomic) IBOutlet UIButton *commteBtn;

@end

@implementation MSVerifyCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"身份验证";
    [self.commteBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
//点击持卡人相机
- (IBAction)clickCardBtn {
}
//点击签发机关相机
- (IBAction)clickBodyBtn {
}
//点击提交按钮
- (IBAction)clickCommteBtn {
    
    if (self.cardTF.text.length == 0) {
        [MBManager showBriefAlert:@"请输入姓名"];
        return;
    }
//    if (self.cardNumTF.text.length == 0) {
//        [MBManager showBriefAlert:@"请输入身份证号"];
//        return;
//    }
//    if (self.cardTF.text.length == 0) {
//        [MBManager showBriefAlert:@"请输入签发机关"];
//        return;
//    }
//    if (self.cardTF.text.length == 0) {
//        [MBManager showBriefAlert:@"请输入身份证有效期"];
//        return;
//    }
//
//    if (self.codeTF.text.length == 0) {
//        [MBManager showBriefAlert:@"请输入验证码"];
//        return;
//    }
    
//    NSMutableDictionary * dict = diction;
//    dict[@"mobile"] = self.phoneTF.text;
//    dict[@"vc_type"] = @"2";
//    dict[@"command"] = @"99001";
//    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        
//        NSLog(@"responseObj-%@",responseObj);
//        if (responseObj[@"body"]) {
//            [MBManager showBriefAlert:@"找回密码成功"];
//            //            SALoginModel* loginmodel = [SALoginModel mj_objectWithKeyValues:responseObj[@"body"]];
//            //            [LFAccountTool save:loginmodel];
//            //            [MBManager hideAlert];
//            //            [LKControllerTool chooseRootViewController];
//            [self.navigationController popViewControllerAnimated:YES];
//        }
}

@end
