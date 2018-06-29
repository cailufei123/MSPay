//
//  MSFeiLvTableViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSFeiLvTableViewCell.h"
@interface MSFeiLvTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *subLb;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@end
@implementation MSFeiLvTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setXiangQinModel:(FeiLVModel *)xiangQinModel{
    self.titleLb.text = xiangQinModel.fee_name;
      self.subLb.text = xiangQinModel.fee_value;
    
}
@end
