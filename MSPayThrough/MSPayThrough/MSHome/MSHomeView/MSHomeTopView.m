//
//  MSHomeTopView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHomeTopView.h"

@implementation MSHomeTopView
-(void)awakeFromNib{
    [super awakeFromNib];

     self.titleViewLyout.constant = 50+kStatusBarHeight;
    
    [self.bagView gradientFreme: CGRectMake(0, 0, LFscreenW, 230+kStatusBarHeight) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
+(instancetype)loadNameHomeTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
