//
//  MSAddCreditCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSAddCreditCardController.h"

@interface MSAddCreditCardController ()
//用户
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//身份证号
@property (weak, nonatomic) IBOutlet UILabel *cardNumLabel;
//卡号
@property (weak, nonatomic) IBOutlet UITextField *bankNumTF;
//发卡行
@property (weak, nonatomic) IBOutlet UITextField *faBankNumTF;
//卡正面
@property (weak, nonatomic) IBOutlet UITextField *bankZhengTF;
//卡末三位
@property (weak, nonatomic) IBOutlet UITextField *bankLastTF;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation MSAddCreditCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"添加信用卡";
    
    
}

- (IBAction)clickNextBtn {
}

@end
