//
//  MSHomeTopView.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSHomeTopView : UIView
+(instancetype)loadNameHomeTopViewXib ;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleViewLyout;
@property (weak, nonatomic) IBOutlet UIView *bagView;
@end
