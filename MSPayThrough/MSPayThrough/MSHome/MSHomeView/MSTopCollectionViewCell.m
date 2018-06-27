//
//  MSTopCollectionViewCell.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSTopCollectionViewCell.h"
#import "ZZCircleProgress.h"
#import "ZZCACircleProgress.h"
@interface MSTopCollectionViewCell()
{
   
    ZZCircleProgress *circle1;
    ZZCircleProgress *circle2;
    ZZCACircleProgress *circle3;
    ZZCACircleProgress *circle4;
}
@property (weak, nonatomic) IBOutlet UIView *huankuanLb;
@property (weak, nonatomic) IBOutlet UILabel *cardLb;

@property (weak, nonatomic) IBOutlet UILabel *IDNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanNumLb;
@property (weak, nonatomic) IBOutlet UILabel *huankuanCountLb;
@property (weak, nonatomic) IBOutlet UILabel *liuMoneyLb;
@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyLb;
@property (weak, nonatomic) IBOutlet UIView *statusView;
@end
@implementation MSTopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //无小圆点、同动画时间
    circle2 = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(0, 0, 80, 80) pathBackColor:nil pathFillColor:[UIColor cyanColor] startAngle:0 strokeWidth:10];
    circle2.clf_centerY = 40;
    circle2.showPoint = NO;
    circle2.animationModel = CircleIncreaseSameTime;
    circle2.progress = 0.6;
    [self.statusView addSubview:circle2];
}
-(void)setHomeModel:(MSHomModel *)homeModel{
    
    
}
@end
