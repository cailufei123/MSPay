//
//  MSHomeTopView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHomeTopView.h"
#import "MSSetController.h"
#import "MSFeiLvViewController.h"
@implementation MSHomeTopView
-(void)awakeFromNib{
    [super awakeFromNib];

     self.titleViewLyout.constant = 50+kStatusBarHeight;
    
    [self.bagView gradientFreme: CGRectMake(0, 0, LFscreenW, 230+kStatusBarHeight) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
  
}
+(instancetype)loadNameHomeTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (IBAction)setClick:(id)sender {
    MSSetController * serviceAgreementVc = [[MSSetController alloc] init];
    [[self viewController].navigationController pushViewController:serviceAgreementVc animated:YES];
}
- (IBAction)shoukuanClick:(id)sender {
}
- (IBAction)huankuanClick:(id)sender {
}
- (IBAction)xingyongkaClick:(id)sender {
    NSMutableDictionary * publicDict = diction;
    publicDict[@"command"] = @"99010";
    [YWRequestData  publicDict:publicDict success:^(id responseObj) {
        ATServiceAgreementController * serviceAgreementVc = [[ATServiceAgreementController alloc] init];
        serviceAgreementVc.htmlurl = responseObj[@"body"][@"xyk_url"];
        serviceAgreementVc.htmltitle = @"我要贷款";
        [[self viewController].navigationController pushViewController:serviceAgreementVc animated:YES];
    }];
}
- (IBAction)daikuanClick:(id)sender {
    NSMutableDictionary * publicDict = diction;
    publicDict[@"command"] = @"99009";
    [YWRequestData  publicDict:publicDict success:^(id responseObj) {
        ATServiceAgreementController * serviceAgreementVc = [[ATServiceAgreementController alloc] init];
        serviceAgreementVc.htmlurl = responseObj[@"body"][@"xd_url"];
        serviceAgreementVc.htmltitle = @"申请信用卡";
        [[self viewController].navigationController pushViewController:serviceAgreementVc animated:YES];
    }];
   
}
- (IBAction)feilvClick:(id)sender {
    MSFeiLvViewController * serviceAgreementVc = [[MSFeiLvViewController alloc] init];
    [[self viewController].navigationController pushViewController:serviceAgreementVc animated:YES];
}

- (IBAction)jihuaClick:(id)sender {
}

- (IBAction)yinghangkaClick:(id)sender {
}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
