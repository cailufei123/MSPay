//
//  MSUserController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSUserController.h"

@interface MSUserController ()

/** 头像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** vip类型*/
@property (weak, nonatomic) IBOutlet UILabel *vipTypeLabel;
/** 是否认证*/
@property (weak, nonatomic) IBOutlet UILabel *renZhengLabel;
/** 用户ID*/
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
/** 手机号*/
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;


@end

@implementation MSUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"用户信息";
    NSLog(@"11");
}
//点击身份证按钮
- (IBAction)clicRenZhenBtn {
}
//点击手机号按钮
- (IBAction)clickPhoneBtn {
}


@end
