//
//  MSHuanKuanPlayCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHuanKuanPlayCell.h"
#import "ProgressView.h"
@interface MSHuanKuanPlayCell()

@property (weak, nonatomic) IBOutlet UILabel *huankuanLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanNumLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanCountLb;
@property (weak, nonatomic) IBOutlet UILabel *liuMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyLb;
@property (weak, nonatomic) IBOutlet UIView *statusView;
@property (weak, nonatomic) IBOutlet UIButton *chaKanBt;
@property (weak, nonatomic) IBOutlet UIButton *canleBt;
@property (strong, nonatomic) ProgressView * progressView;
@end
@implementation MSHuanKuanPlayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.progressView = [ProgressView createProgressWithFrame:CGRectMake(0, 0, 60, 60) backColor:bagColor color:[SVGloble colorWithHexString:@"#69c30c"] proportion:0];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [ self.progressView  showContentData];
    
    
    [self.statusView addSubview: self.progressView ];
    [self.chaKanBt addTarget:self action:@selector(chaKanBtClick) forControlEvents:UIControlEventTouchUpInside];
      [self.canleBt addTarget:self action:@selector(canleBtClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)chaKanBtClick{
    if (self.skipDetailsVc) {
        self.skipDetailsVc(_homeModel);
    }
    
}
-(void)canleBtClick{
    if (self.cacnlJihuaVc) {
        self.cacnlJihuaVc(_homeModel);
    }
    
}

-(void)setHomeModel:(MSHomModel *)homeModel{
    _homeModel = homeModel;
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
    
    self.canleBt.userInteractionEnabled = NO;
    if ([homeModel.qrp_status isEqualToString:@"1"]) {
        self.progressView .dataNameLabel.text  = @"未开始";
    }else if ([homeModel.qrp_status isEqualToString:@"2"]){
        self.progressView .dataNameLabel.text  = @"进行中";
        self.canleBt.userInteractionEnabled = YES;
    }else if ([homeModel.qrp_status isEqualToString:@"3"]){
        self.progressView .dataNameLabel.text  = @"已完成";
        self.progressView .dataLabel.textColor = [SVGloble colorWithHexString:@"#69c30c"];
        self.progressView .dataNameLabel.textColor = [SVGloble colorWithHexString:@"#69c30c"];

    }else if ([homeModel.qrp_status isEqualToString:@"4"]){
        self.progressView .dataNameLabel.text  = @"已取消";

    }
    self.progressView . proportion = (([homeModel.qrp_repay_money_finished doubleValue]*100)/[homeModel.qrp_repay_money_total doubleValue])/100;

    [self.progressView showProgress];
    
    
    
    
     //1待执行 2执行中 3已完成 4处理失败 5已取消
}
-(NSString *)numberSuitScanf:(NSString*)number{
    
    
    NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(0, number.length-4) withString:@"**** **** **** "];
    return numberString;
    
}
-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    frame.origin.x = 10;
    frame.size.width = LFscreenW-20;
//    frame.size.height = 150 - 30;
//    frame.origin.y += 30;
    [super setFrame:frame];
}
@end
