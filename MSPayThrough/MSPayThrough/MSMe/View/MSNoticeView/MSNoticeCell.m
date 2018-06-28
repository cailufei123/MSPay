//
//  MSNoticeCell.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSNoticeCell.h"

@interface MSNoticeCell()

/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
内容
 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
/**
时间
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation MSNoticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)noticeCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setFrame:(CGRect)frame{
  
    frame.origin.y += 15;
//    frame.size.height -= 8;
    
    [super setFrame:frame];
}

@end
