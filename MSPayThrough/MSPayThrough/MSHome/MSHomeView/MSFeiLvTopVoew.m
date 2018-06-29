//
//  MSFeiLvTopVoew.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSFeiLvTopVoew.h"

@implementation MSFeiLvTopVoew

-(void)awakeFromNib{
    [super awakeFromNib];
    
  
    
}
+(instancetype)loadNameFeiLvTopVoewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
