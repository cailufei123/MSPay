//
//  MSDetailsTopView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDetailsTopView.h"
@interface MSDetailsTopView()
@property (weak, nonatomic) IBOutlet UILabel *huankuanLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanNumLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanCountLb;
@property (weak, nonatomic) IBOutlet UILabel *liuMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyLb;
@property (weak, nonatomic) IBOutlet UIView *statusView;
@property (weak, nonatomic) IBOutlet UILabel *lastLb;
@property (weak, nonatomic) IBOutlet UIView *viewLyout;
@end
@implementation MSDetailsTopView

-(void)awakeFromNib{
    [super awakeFromNib];
    
  
    
    [self.statusView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
+(instancetype)loadNameDetailsTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
