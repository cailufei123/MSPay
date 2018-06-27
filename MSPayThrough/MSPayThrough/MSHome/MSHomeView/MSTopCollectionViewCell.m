//
//  MSTopCollectionViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSTopCollectionViewCell.h"
#import "ZZCircleProgress.h"
#import "ZZCACircleProgress.h"
@interface MSTopCollectionViewCell()
{
   
    ZZCircleProgress *circle1;
    ZZCircleProgress *circle2;
    ZZCACircleProgress *circle3;
    ZZCACircleProgress *circle4;
}
@property (weak, nonatomic) IBOutlet UILabel *huankuanLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanNumLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanCountLb;
@property (weak, nonatomic) IBOutlet UILabel *liuMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyLb;
@property (weak, nonatomic) IBOutlet UIView *statusView;
@end
@implementation MSTopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //无小圆点、同动画时间
    circle2 = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(0, 0, 60, 60) pathBackColor:nil pathFillColor:[UIColor greenColor] startAngle:0 strokeWidth:5];
    circle2.clf_centerY = 30;
    circle2.showPoint = NO;
    circle2.animationModel = CircleIncreaseSameTime;
    circle2.progress = 0.6;
    [self.statusView addSubview:circle2];
}
-(void)setHomeModel:(MSHomModel *)homeModel{
    self.huankuanLb.text = [NSString stringWithFormat:@"还款周期：%@",homeModel.qrp_plan_cycle] ;
     self.IDNumberLb.text = homeModel.mbi_code;
      self.cardLb.text = [self numberSuitScanf:homeModel.qrp_credit_card_no];
    self.huankuanNumLb.text = [NSString stringWithFormat:@"%0.1f",[homeModel.qrp_repay_money_finished doubleValue]*0.01];
    self.huankuanCountLb.text = homeModel.qrp_repay_count;
    self.liuMoneyLb.text = [NSString stringWithFormat:@"%0.2f",[homeModel.qrp_reserve_money doubleValue]*0.01];
    self.shouxuMoneyLb.text =[NSString stringWithFormat:@"%0.2f",[homeModel.qrp_repay_money_fee_total doubleValue]*0.01 + [homeModel.qrp_repay_money_fee_pay_total doubleValue]*0.01*[homeModel.qrp_repay_count doubleValue]] ;
}
-(NSString *)numberSuitScanf:(NSString*)number{
    
    
    NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(0, number.length-4) withString:@"**** **** **** "];
    return numberString;
    
}

@end
