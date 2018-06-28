//
//  MSHomeTableTopView.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSHomeTableTopView : UIView
+(instancetype)loadNameHomeTableTopViewXib ;
@property(nonatomic,strong)NSMutableArray * playRepayments;
@property(nonatomic,strong) NSMutableArray * arrar;
@end
