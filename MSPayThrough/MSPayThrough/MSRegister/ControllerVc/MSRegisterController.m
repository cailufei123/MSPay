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
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation MSRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"快速注册";
    [self.registerBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
//点击注册按钮
- (IBAction)clickRegisterBtn {
}

@end
