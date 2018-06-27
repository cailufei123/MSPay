//
//  MSFrogetPwdController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSFrogetPwdController.h"

@interface MSFrogetPwdController ()
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

@property (weak, nonatomic) IBOutlet UIButton *FinshBtn;
@end

@implementation MSFrogetPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"找回密码";
    [self.FinshBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
//点击完成按钮
- (IBAction)clickFinshBtn {
}


@end
