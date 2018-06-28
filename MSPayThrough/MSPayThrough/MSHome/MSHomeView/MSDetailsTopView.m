//
//  MSDetailsTopView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDetailsTopView.h"
@interface MSDetailsTopView()
@property (weak, nonatomic) IBOutlet UILabel *huankuanLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanNumLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanCountLb;
@property (weak, nonatomic) IBOutlet UILabel *liuMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyLb;
@property (weak, nonatomic) IBOutlet UIView *statusView;
@property (weak, nonatomic) IBOutlet UILabel *lastLb;
@property (weak, nonatomic) IBOutlet UIView *viewLyout;
@end
@implementation MSDetailsTopView

-(void)awakeFromNib{
    [super awakeFromNib];
    
  
    
    [self.statusView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
+(instancetype)loadNameDetailsTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
-(void)setHomeModel:(MSHomModel *)homeModel{
    self.huankuanLb.text = [NSString stringWithFormat:@"还款周期：%@",homeModel.qrp_plan_cycle] ;
    self.IDNumberLb.text = homeModel.mbi_code;
    self.cardLb.text = [self numberSuitScanf:homeModel.qrp_credit_card_no];
    self.huankuanNumLb.text = [NSString stringWithFormat:@"%0.1f",[homeModel.qrp_repay_money_total doubleValue]*0.01];
    self.huankuanCountLb.text = homeModel.qrp_repay_count;
    self.liuMoneyLb.text = [NSString stringWithFormat:@"%0.2f",[homeModel.qrp_reserve_money doubleValue]*0.01];
    self.shouxuMoneyLb.text =[NSString stringWithFormat:@"%0.2f",[homeModel.qrp_repay_money_fee_total doubleValue]*0.01 + [homeModel.qrp_repay_money_fee_pay_total doubleValue]*0.01*[homeModel.qrp_repay_count doubleValue]] ;
   
    
}
-(NSString *)numberSuitScanf:(NSString*)number{
    
    
    NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(0, number.length-4) withString:@"**** **** **** "];
    return numberString;
    
}

@end
