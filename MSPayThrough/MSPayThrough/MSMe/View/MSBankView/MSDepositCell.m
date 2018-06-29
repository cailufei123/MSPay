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
//渲染view
@property (weak, nonatomic) IBOutlet UIView *xuanRanVIew;

@end

@implementation MSDepositCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgView.cornerRadius = 6;
    self.bgView.masksToBounds = YES;
    self.xuanRanVIew.cornerRadius = 6;
    self.xuanRanVIew.masksToBounds = YES;
    
    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCardType)];
    
    self.bankCardType.userInteractionEnabled=YES;
    [self.bankCardType addGestureRecognizer:tapRecognizer];
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

- (void)clickCardType{
  
    if ([self.delegate respondsToSelector:@selector(clickCardTypeButon:)]) {
        [self.delegate clickCardTypeButon:self];
    }
}

- (void)setDeposit:(MSDepositModel *)deposit{
    _deposit = deposit;
    
    [self.bankImageView sd_setImageWithURL:[NSURL URLWithString:deposit.mcp_bank_ico] placeholderImage:[UIImage imageNamed:@""]];
    self.bankNameLabel.text = deposit.mcp_bank_name;
   
    NSString *endStr = [deposit.mcp_card_no substringWithRange:NSMakeRange(deposit.mcp_card_no.length - 4,4)];
    self.bankNumLabel.text = [NSString stringWithFormat:@"****  ****  ****  %@",endStr];
    self.userName.text = deposit.mcp_user_name;
    self.bankCardType.text = @"主卡";
}
- (void)setIndexpath:(NSIndexPath *)indexpath{
    _indexpath = indexpath;
    
    if (indexpath.row % 2 == 0) {
        [self.xuanRanVIew gradientFreme: CGRectMake(0, 0, LFscreenW-30, 172) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    }else{
        [self.xuanRanVIew gradientFreme: CGRectMake(0, 0, LFscreenW-30, 172) startColor:[SVGloble colorWithHexString:@"#1C86EE"] endColor:[SVGloble colorWithHexString:@"#00688B"]];
    }
}

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x += MSdepositCellMargin;
    frame.origin.y += 8;
    frame.size.width -= MSdepositCellMargin * 2;
    frame.size.height -= 8;
    
    [super setFrame:frame];
}
@end
