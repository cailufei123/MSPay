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
//验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@end

@implementation MSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"快速注册";
    [self.registerBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}

//点击发送验证码按钮
- (IBAction)clickCardBtn {
    
    if (![self.phoneTF.text isMobileNumber] || self.phoneTF.text.length == 0) {
        [MBProgressHUD showError:@"请输入正确的手机号" toView:self.view];
    }else{
        //获取验证码
        [self getCardData];
    }
    
}

//获取验证码
- (void)getCardData{
    NSMutableDictionary * dict = diction;
    dict[@"mobile"] = self.phoneTF.text;
    dict[@"vc_type"] = @"1";
    dict[@"command"] = @"99001";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        NSLog(@"responseObj-%@",responseObj);
        if (![responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [MBProgressHUD showError:responseObj[@"head"][@"status_desc"] toView:self.view];
        }else{
            [self codeTimerWithTiming:@selector(CodeTiming:) finish:@selector(CodeFinish)];
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

//点击注册按钮
- (IBAction)clickRegisterBtn {
    
    if (self.pwdTF.text.length < 6 || self.pwdTF.text.length >20) {
        [MBProgressHUD showError:@"密码由6-20位字母或数组组成" toView:self.view];
        return;
    }
    
    if (![self.otherPhoneTF.text isMobileNumber]) {
        [MBProgressHUD showError:@"请输入正确的手机号" toView:self.view];
        return;
    }
    
    if (self.codeTF.text.length == 0) {
        [MBManager showBriefAlert:@"请输入验证码"];
        return;
    }
    
    NSMutableDictionary * dict = diction;
    dict[@"mobile"] = self.phoneTF.text;
    dict[@"validate_code"] =self.codeTF.text;
    dict[@"user_pwd"] =self.pwdTF.text;
    dict[@"invited_mobile"] =self.otherPhoneTF.text;
    dict[@"command"] = @"1001";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        NSLog(@"responseObj-%@",responseObj);
        if (responseObj[@"body"]) {
            [MBManager showBriefAlert:@"注册成功"];
//            SALoginModel* loginmodel = [SALoginModel mj_objectWithKeyValues:responseObj[@"body"]];
//            [LFAccountTool save:loginmodel];
//            [MBManager hideAlert];
//            [LKControllerTool chooseRootViewController];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

#pragma -mark 验证码倒计时
/**
 验证码倒计时
 @SEL 正在倒计时
 @SEL 倒计时结束
 */
- (void)codeTimerWithTiming:(SEL)timingMethod finish:(SEL)finishMethod
{
    //提示60秒以后重新发送
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0)
        {
            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.getCodeBtn.enabled = YES;
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self performSelector:finishMethod withObject:nil];
                
            });
        }
        else
        {
            //在主线程设置按钮不可用
            dispatch_async(dispatch_get_main_queue(), ^{
                self.getCodeBtn.enabled = NO;;
            });
            
            // int minutes = timeout / 60;
            int seconds = timeout % 60;
            if (seconds == 0) {
                seconds = timeout;
            }
            NSString *strTime = [NSString stringWithFormat:@"%.2d秒后获取", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self performSelector:timingMethod withObject:strTime];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)CodeTiming:(NSString *)timeStr
{
    self.getCodeBtn.titleLabel.text = timeStr;
    [self.getCodeBtn setTitle:timeStr forState:UIControlStateNormal];
    self.getCodeBtn.userInteractionEnabled = NO;
}

- (void)CodeFinish
{
    self.getCodeBtn.titleLabel.text = @"获取验证码";
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.getCodeBtn.userInteractionEnabled = YES;
}

@end
