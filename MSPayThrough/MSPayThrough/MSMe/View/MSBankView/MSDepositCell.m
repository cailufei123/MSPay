//
//  MSDepositCell.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDepositCell.h"

static const int MSdepositCellMargin = 15;

@interface MSDepositCell()
/**银行图片*/
@property (weak, nonatomic) IBOutlet UIImageView *bankImageView;
/**银行名称*/
@property (weak, nonatomic) IBOutlet UILabel *bankNameLabel;
/**银行卡号*/
@property (weak, nonatomic) IBOutlet UILabel *bankNumLabel;
/**用户名*/
@property (weak, nonatomic) IBOutlet UILabel *userName;
/**卡类型*/
@property (weak, nonatomic) IBOutlet UILabel *bankCardType;
//背景view
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation MSDepositCell

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

+ (instancetype)depositCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x += MSdepositCellMargin;
    frame.origin.y += 8;
    frame.size.width -= MSdepositCellMargin * 2;
    frame.size.height -= 8;
    
    [super setFrame:frame];
}
@end
