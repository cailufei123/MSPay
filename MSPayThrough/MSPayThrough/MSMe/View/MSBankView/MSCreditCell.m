//
//  MSCreditCell.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCreditCell.h"

static const int MSCreditCellMargin = 15;

@interface MSCreditCell()
/**银行图片*/
@property (weak, nonatomic) IBOutlet UIImageView *bankImageView;
/**银行名称*/
@property (weak, nonatomic) IBOutlet UILabel *bankNameLabel;
/**银行卡号*/
@property (weak, nonatomic) IBOutlet UILabel *bankNumLabel;
/**用户名*/
@property (weak, nonatomic) IBOutlet UILabel *userName;
/**有效期*/
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//背景view
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation MSCreditCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgView.cornerRadius = 6;
    self.bgView.masksToBounds = YES;
}

//点击删除按钮
- (IBAction)clickDeleteBtn {
    if ([self.delegate respondsToSelector:@selector(clickDeleteButton:)]) {
        [self.delegate clickDeleteButton:self];
    }
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x += MSCreditCellMargin;
    frame.origin.y += 8;
    frame.size.width -= MSCreditCellMargin * 2;
    frame.size.height -= 8;
    
    [super setFrame:frame];
}

+ (instancetype)creditCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
