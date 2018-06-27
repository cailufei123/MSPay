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
}

@end
