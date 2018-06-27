//
//  MSHomeTableViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHomeTableViewCell.h"
@interface MSHomeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *statusLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *billLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;
@end
@implementation MSHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setListModel:(MSHomListModel *)listModel{
    self.timeLb.text = listModel.tm_trade_time;
     self.billLb.text = listModel.tm_serial_no;
      self.moneyLb.text = listModel.tm_transaction_money;
     self.cardLb.text = [self numberSuitScanf:listModel.tm_card_no];
  
}
-(NSString *)numberSuitScanf:(NSString*)number{
    

      NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(0, number.length-4) withString:@"**** **** **** "];
    return numberString;
    
}


@end
