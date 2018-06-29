//
//  MSCreditCell.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCreditCell.h"
#import "MSBankMcp.h"

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
@property (weak, nonatomic) IBOutlet UIView *xuanRanView;

@end

@implementation MSCreditCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgView.cornerRadius = 6;
    self.bgView.masksToBounds = YES;
    
    self.xuanRanView.cornerRadius = 6;
    self.xuanRanView.masksToBounds = YES;
}

//点击删除按钮
- (IBAction)clickDeleteBtn {
    if ([self.delegate respondsToSelector:@selector(clickDeleteButton:)]) {
        [self.delegate clickDeleteButton:self];
    }
}

- (void)setMcp:(MSBankMcp *)mcp{
    _mcp = mcp;
    [self.bankImageView sd_setImageWithURL:[NSURL URLWithString:mcp.mcp_bank_ico] placeholderImage:[UIImage imageNamed:@""]];
    self.bankNameLabel.text = mcp.mcp_bank_name;
    LFLog(@"mcp.mcp_card_no-%@",mcp.mcp_card_no);
    if (mcp.mcp_card_no.length >4) {
        NSString *endStr = [mcp.mcp_card_no substringWithRange:NSMakeRange(mcp.mcp_card_no.length - 4,4)];
        self.bankNumLabel.text = [NSString stringWithFormat:@"****  ****  ****%@",endStr];
    }else{
        self.bankNumLabel.text = mcp.mcp_card_no;
    }
    
    self.userName.text = mcp.mcp_user_name;
    self.timeLabel.text = mcp.mcp_validity_date;
    
}

- (void)setIndexpath:(NSIndexPath *)indexpath{
    _indexpath = indexpath;
    
    if (indexpath.row % 2 == 0) {
        [self.xuanRanView gradientFreme: CGRectMake(0, 0, LFscreenW - 30, 172) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    }else{
        [self.xuanRanView gradientFreme: CGRectMake(0, 0, LFscreenW - 30, 172) startColor:[SVGloble colorWithHexString:@"#1C86EE"] endColor:[SVGloble colorWithHexString:@"#00688B"]];
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
