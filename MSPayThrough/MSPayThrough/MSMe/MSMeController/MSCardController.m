//
//  MSCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCardController.h"
#import "MSVerifyCardController.h"
#import "YCArchiveTool.h"
#import "MSAddDepositCardController.h"
#import "UIViewController+BarButton.h"
#import "SANavigationController.h"

@interface MSCardController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//是否绑定身份证
@property (weak, nonatomic) IBOutlet UILabel *cardNumLabel;
//是否绑定银行卡
@property (weak, nonatomic) IBOutlet UILabel *bankLabel;
@property (weak, nonatomic) IBOutlet UIButton *cardNumBtn;
@property (weak, nonatomic) IBOutlet UIButton *bankBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;
@end

@implementation MSCardController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (ABOVE_IOS11) {
        self.topViewY.constant = 0;
    }else{
        self.topViewY.constant = 64;
    }
    if (self.fromClassVc == [SANavigationController class]) {
        [self addLeftBarButtonWithImage:[UIImage imageNamed:@"icon_back"] action:@selector(back)];
    }
    
    self.navigationItem.title = @"身份认证";
    [self.backImageView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
    if ([YCArchiveTool meModel].mci.mci_id_card.length) {
        self.cardNumLabel.text = @"已认证";
        self.cardNumBtn.enabled = NO;
    }else{
        self.cardNumLabel.text = @"未认证";
        self.cardNumBtn.enabled = YES;
    }
  
}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//点击防范身份证
- (IBAction)clickIdentityCardBtn {
    MSVerifyCardController *verifyVc = [[MSVerifyCardController alloc] init];
    [self.navigationController pushViewController:verifyVc animated:YES];
}
//点击绑定储蓄卡
- (IBAction)clickBankCardBtn {
    MSAddDepositCardController *addDepositVc = [[MSAddDepositCardController alloc] init];
    [self.navigationController pushViewController:addDepositVc animated:YES];
}

@end
