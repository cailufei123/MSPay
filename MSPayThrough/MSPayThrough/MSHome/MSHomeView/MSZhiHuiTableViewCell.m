//
//  MSZhiHuiTableViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSZhiHuiTableViewCell.h"
#import "MSHuanKuanPlayViewController.h"
@interface MSZhiHuiTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *cardNameLb;
@property (weak, nonatomic) IBOutlet UILabel *zhngdnaLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuariLb;
@property (weak, nonatomic) IBOutlet UIButton *zhidingJihuaBt;
@property (weak, nonatomic) IBOutlet UIButton *chankanLiushuiBt;
@property (weak, nonatomic) IBOutlet UIButton *chakanJIhuaBt;
@property (weak, nonatomic) IBOutlet UIView *bgVIew;

@end
@implementation MSZhiHuiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
   
}
-(void)setBankMcp:(MSBankMcpModel *)bankMcp{
    _bankMcp = bankMcp;
    [self.logo sd_setImageWithURL:[NSURL URLWithString:bankMcp.mcp_bank_ico]];
    self.cardNameLb.text =[NSString stringWithFormat:@"%@|尾号%@",bankMcp.mcp_bank_name,[bankMcp.mcp_card_no substringWithRange:NSMakeRange(bankMcp.mcp_card_no.length-4,4)]];
    self.zhngdnaLb.text = bankMcp.mcp_bill_date;
      self.huankuariLb.text = bankMcp.mcp_repayment_date;
    [self.zhidingJihuaBt addTarget:self action:@selector(zhidingJihuaBtClick) forControlEvents:UIControlEventTouchUpInside];
     [self.chankanLiushuiBt addTarget:self action:@selector(chankanLiushuiBtClick) forControlEvents:UIControlEventTouchUpInside];
     [self.chakanJIhuaBt addTarget:self action:@selector(chakanJIhuaBtClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)zhidingJihuaBtClick{
   
}
-(void)chankanLiushuiBtClick{
    
}
-(void)chakanJIhuaBtClick{
    MSHuanKuanPlayViewController * huanKuanPlayV =  [[MSHuanKuanPlayViewController alloc] init];
    [[self viewController].navigationController pushViewController:huanKuanPlayV animated:YES];
}
- (void)setIndexpath:(NSIndexPath *)indexpath{
    _indexpath = indexpath;
    
    if (indexpath.row % 2 == 0) {
       
         [self.bgVIew gradientFreme: CGRectMake(0, 0, LFscreenW-40, 162) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    }else{
          [self.bgVIew gradientFreme: CGRectMake(0, 0, LFscreenW-40, 162) startColor:[SVGloble colorWithHexString:@"#00688B"] endColor:[SVGloble colorWithHexString:@"#1C86EE"]];
//        [self.xuanRanView gradientFreme: CGRectMake(0, 0, LFscreenW - 30, 172) startColor:[SVGloble colorWithHexString:@"#1C86EE"] endColor:[SVGloble colorWithHexString:@"#00688B"]];
    }
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x = 20;
    frame.origin.y += 8;
    frame.size.width -= 20 * 2;
    frame.size.height -= 8;
    
    [super setFrame:frame];
}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
