//
//  MSTopCollectionViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSTopCollectionViewCell.h"

#import "ProgressView.h"
@interface MSTopCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *huankuanLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanNumLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanCountLb;
@property (weak, nonatomic) IBOutlet UILabel *liuMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyLb;
@property (weak, nonatomic) IBOutlet UIView *statusView;
@property (strong, nonatomic) ProgressView * progressView;
@end
@implementation MSTopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
   self.progressView = [ProgressView createProgressWithFrame:CGRectMake(0, 0, 60, 60) backColor:bagColor color:[SVGloble colorWithHexString:@"#69c30c"] proportion:0];
   
    //如果需要内容数据时使用
//     self.progressView .data           = @"￥120";
//     self.progressView .dataName       = @"金额";
    [ self.progressView  showContentData];
    
    
    [self.statusView addSubview: self.progressView ];
}
-(void)setHomeModel:(MSHomModel *)homeModel{
    self.huankuanLb.text = [NSString stringWithFormat:@"还款周期：%@",homeModel.qrp_plan_cycle] ;
     self.IDNumberLb.text = homeModel.mbi_code;
      self.cardLb.text = [self numberSuitScanf:homeModel.qrp_credit_card_no];
    self.huankuanNumLb.text = [NSString stringWithFormat:@"%0.1f",[homeModel.qrp_repay_money_total doubleValue]*0.01];
    self.huankuanCountLb.text = homeModel.qrp_repay_count;
    self.liuMoneyLb.text = [NSString stringWithFormat:@"%0.2f",[homeModel.qrp_reserve_money doubleValue]*0.01];
    self.shouxuMoneyLb.text =[NSString stringWithFormat:@"%0.2f",[homeModel.qrp_repay_money_fee_total doubleValue]*0.01 + [homeModel.qrp_repay_money_fee_pay_total doubleValue]*0.01*[homeModel.qrp_repay_count doubleValue]] ;
       self.progressView .dataLabel.text = [NSString stringWithFormat:@"%0.0f%%",([homeModel.qrp_repay_money_finished doubleValue]*100)/[homeModel.qrp_repay_money_total doubleValue] ] ;;
    self.progressView .dataLabel.textColor = deepGrayColor;
    self.progressView .dataNameLabel.textColor = deepGrayColor;
    if ([homeModel.qrp_status isEqualToString:@"1"]) {
         self.progressView .dataNameLabel.text  = @"未开始";
    }else if ([homeModel.qrp_status isEqualToString:@"2"]){
         self.progressView .dataNameLabel.text  = @"进行中";
        
    }else if ([homeModel.qrp_status isEqualToString:@"3"]){
          self.progressView .dataNameLabel.text  = @"已完成";
        self.progressView .dataLabel.textColor = [SVGloble colorWithHexString:@"#69c30c"];
        self.progressView .dataNameLabel.textColor = [SVGloble colorWithHexString:@"#69c30c"];
        
    }else if ([homeModel.qrp_status isEqualToString:@"4"]){
          self.progressView .dataNameLabel.text  = @"已取消";
        
    }
    self.progressView . proportion = (([homeModel.qrp_repay_money_finished doubleValue]*100)/[homeModel.qrp_repay_money_total doubleValue])/100;
  
    [self.progressView showProgress];
}
-(NSString *)numberSuitScanf:(NSString*)number{
    
    
    NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(0, number.length-4) withString:@"**** **** **** "];
    return numberString;
    
}

@end
