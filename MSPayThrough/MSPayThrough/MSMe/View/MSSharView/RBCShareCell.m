//
//  RBCShareCell.m
//  JapanVillage
//
//  Created by ribencun on 2018/3/16.
//  Copyright © 2018年 ribencun. All rights reserved.
//

#import "RBCShareCell.h"
#import "UIImageView+WebCache.h"

@interface RBCShareCell()

//第三方图片
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
//名称
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation RBCShareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setIndexpath:(NSIndexPath *)indexpath
{
    _indexpath = indexpath;
    
    if (indexpath.row == 0) {
        [self.iconImageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"icon_wexin"]];
        self.titleLabel.text = @"微信好友";
    }else if (indexpath.row == 1){
        [self.iconImageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"icon_pengyouquan"]];
        self.titleLabel.text = @"微信朋友圈";
    }
}




@end
