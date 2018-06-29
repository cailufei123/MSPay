//
//  MSShaiXuanViewAlertView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSShaiXuanViewAlertView.h"

@implementation MSShaiXuanViewAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self createBt];
    }
    return self;
}

-(void)createBt{
    NSArray * btttons = [NSArray arrayWithObjects:@"全部",@"执行中",@"已完成",@"已取消", nil];
    //中间3个按钮
    int maxCols = 2;
    CGFloat buttonStartX = 20;
    CGFloat butttonStartY = 0;
    CGFloat xMargin = 20;
    CGFloat yMargin = 10;
    CGFloat buttonH = 36;
    CGFloat buttonW = (LFscreenW-(maxCols - 1) * xMargin - 2*buttonStartX)/maxCols;
    
    for (int i = 0; i < btttons.count; i++) {
        
       
        //计算X、Y
        int row = i / maxCols;
        int col = i % maxCols;
        UIButton *bt = [[UIButton alloc] init];
        CGFloat buttonX = buttonStartX + col * (xMargin + buttonW);
        CGFloat buttonEndY = butttonStartY + row * (buttonH+yMargin);
        [bt setTitle:btttons[i] forState:UIControlStateNormal];
      
        [bt setTitleColor:deepGrayColor forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:13];
        [bt  addTarget:self action:@selector(clickBgBtClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
        bt.tag = i;
        if (i>0) {
             bt.tag = i+1;
        }
        bt.frame = CGRectMake(buttonX, buttonEndY, buttonW, buttonH);
        
       
        
    }
   
}
-(void)clickBgBtClick:(UIButton *)bt{
    if (self.shaixuan) {
        self.shaixuan(bt) ;
    }
    
}
@end
