//
//  MSCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCardController.h"
#import "MSVerifyCardController.h"

@interface MSCardController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@end

@implementation MSCardController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"身份认证";
    [self.backImageView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
//点击防范身份证
- (IBAction)clickIdentityCardBtn {
    MSVerifyCardController *verifyVc = [[MSVerifyCardController alloc] init];
    [self.navigationController pushViewController:verifyVc animated:YES];
}
//点击绑定储蓄卡
- (IBAction)clickBankCardBtn {
}

@end
