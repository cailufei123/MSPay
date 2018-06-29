//
//  MSDetailsTableViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDetailsTableViewCell.h"
@interface MSDetailsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *statusLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *lastLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;

@end
@implementation MSDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setXiangQinModel:(XiangQinModel *)xiangQinModel{
   
    self.timeLb.text =xiangQinModel.qrpd_execute_datetime;
   //1待执行 2执行中 3已完成 4处理失败 5已取消
    self.moneyLb.text = [NSString stringWithFormat:@"%0.2f",[xiangQinModel.qrpd_money doubleValue]*0.01];
    if ([xiangQinModel.qrpd_status isEqualToString:@"1"]) {
       self.lastLb.text = @"待执行";
    }else if ([xiangQinModel.qrpd_status isEqualToString:@"2"]){
       self.lastLb.text  = @"执行中";
        
    }else if ([xiangQinModel.qrpd_status isEqualToString:@"3"]){
       self.lastLb.text  = @"已完成";
//        self.progressView .dataLabel.textColor = [SVGloble colorWithHexString:@"#69c30c"];
//        self.progressView .dataNameLabel.textColor = [SVGloble colorWithHexString:@"#69c30c"];
        
    }else if ([xiangQinModel.qrpd_status isEqualToString:@"4"]){
       self.lastLb.text  = @"处理失败";
        
    }else if ([xiangQinModel.qrpd_status isEqualToString:@"5"]){
        self.lastLb.text  = @"已取消";
        
    }
    if ([xiangQinModel.qrpd_type isEqualToString:@"1"]) {
        self.statusLb.text = @"消费";
        self.statusLb.backgroundColor = [SVGloble colorWithHexString:@"#ef6468"];
    }else {
        self.statusLb.text  = @"还款";
          self.statusLb.backgroundColor = [SVGloble colorWithHexString:@"#713d92"];
    }
    
}
-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    frame.origin.x = 20;
    frame.size.width = LFscreenW-40;
    //frame.size.height = 150 - 30;
    //frame.origin.y += 30;
    [super setFrame:frame];
}
@end
