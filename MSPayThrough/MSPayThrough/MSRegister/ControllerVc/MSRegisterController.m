//
//  MSRegisterController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSRegisterController.h"

@interface MSRegisterController ()

/**
 手机号
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
/**
 验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
/**
 密码
 */
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
/**
 另外手机号
 */
@property (weak, nonatomic) IBOutlet UITextField *otherPhoneTF;
//注册按钮
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation MSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"快速注册";
    [self.registerBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}

//点击发送验证码按钮
- (IBAction)clickCardBtn {
    if ([self.phoneTF.text isMobileNumberClassification]) {
        [MBProgressHUD showMessag:@"请输入正确的手机号" toView:self.view];
    }
    
}

//点击注册按钮
- (IBAction)clickRegisterBtn {
    NSMutableDictionary * dict = diction;
    dict[@"mobile"] = self.phoneTF.text;
    dict[@"validate_code"] =self.codeTF.text;
    dict[@"user_pwd"] =self.pwdTF.text;
    dict[@"invited_mobile"] =self.otherPhoneTF.text;
    dict[@"command"] = @"1001";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        NSLog(@"responseObj-%@",responseObj);
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

@end
