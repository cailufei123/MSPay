//
//  MSZhiDingJihuaViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSZhiDingJihuaViewController.h"

@interface MSZhiDingJihuaViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *cardnameLb;
@property (weak, nonatomic) IBOutlet UILabel *zhngdanLb;
@property (weak, nonatomic) IBOutlet UILabel *haunkuanLB;
@property (weak, nonatomic) IBOutlet UITextField *enterTf;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UILabel *countLB;

@end

@implementation MSZhiDingJihuaViewController
- (void)viewWillAppear:(BOOL)animated {
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:naverTextColor}];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:blackTextColor}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.bgView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    self.navigationItem.title = @"制定还款计划";
         self.automaticallyAdjustsScrollViewInsets = NO;
    [self.logo sd_setImageWithURL:[NSURL URLWithString:self.bankMcp.mcp_bank_ico]];
    self.cardnameLb.text =[NSString stringWithFormat:@"%@|尾号%@",self.bankMcp.mcp_bank_name,[self.bankMcp.mcp_card_no substringWithRange:NSMakeRange(self.bankMcp.mcp_card_no.length-4,4)]];
    self.dateLb.text = self.bankMcp.mcp_bill_date;
    self.countLB.text = self.bankMcp.mcp_repayment_date;
    self.enterTf.delegate = self;
    self.enterTf.borderStyle = UITextBorderStyleNone;
    [ self.enterTf addTarget:self
                  action:@selector(textFieldDidChangeValue:)
        forControlEvents:UIControlEventEditingChanged];
   
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"3001";
    dict[@"bank_acc_name"] = self.bankMcp.mcp_user_name;
    dict[@"bank_acc_no"] = self.bankMcp.mcp_card_no;
    [YWRequestData publicDict:dict success:^(id responseObj) {
//        NSMutableArray *dates = [NSMutableArray array];
//        long long nowTime = 1471491674, //开始时间
//        endTime = 1472528474,//结束时间
//        dayTime = 24*60*60,
//        time = nowTime - nowTime%dayTime;
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"yyyy/MM/dd"];
//        
//        while (time < endTime) {
//            NSString *showOldDate = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
//            [dates addObject:showOldDate];
//            time += dayTime;
//        }
    }];
  
}
- (void)textFieldDidChangeValue:(id)sender
{
 NSString * texts = ((UITextField *)sender).text;
     LFLog(@"%@",texts);
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"3001";
     dict[@"bank_acc_name"] = self.bankMcp.mcp_bank_name;
     dict[@"bank_acc_no"] = self.bankMcp.mcp_card_no;
    [YWRequestData publicDict:dict success:^(id responseObj) {
        
    }];
}
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    LFLog(@"%@",textField.text);
//}

@end
