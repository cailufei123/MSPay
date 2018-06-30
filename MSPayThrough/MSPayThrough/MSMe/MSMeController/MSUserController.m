//
//  MSUserController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSUserController.h"
#import "MSCardController.h"

@interface MSUserController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (ABOVE_IOS11) {
        self.topViewY.constant = 8;
    }else{
        self.topViewY.constant = 72;
    }
    
    self.navigationItem.title = @"用户信息";
    
    self.vipTypeLabel.text = @"大众会员";
    if ([YCArchiveTool meModel].mci.mci_id_card.length) {
        self.renZhengLabel.text = @"已认证";
    }
    
    self.userIDLabel.text = [YCArchiveTool meModel].mci.mbi_id;
    self.phoneLabel.text = [YCArchiveTool meModel].mci.mci_mobile_phone;
}
//点击身份证按钮
- (IBAction)clicRenZhenBtn {
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}
//点击手机号按钮
- (IBAction)clickPhoneBtn {
    MSCardController *cardVc = [[MSCardController alloc] init];
    [self.navigationController pushViewController:cardVc animated:YES];
}


@end
