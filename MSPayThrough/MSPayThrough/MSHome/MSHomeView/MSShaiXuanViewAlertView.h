//
//  MSShaiXuanViewAlertView.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSShaiXuanViewAlertView : UIView
@property(nonatomic,copy)void(^shaixuan)(UIButton * button);
@end