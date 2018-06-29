//
//  MSXunzeXinYongKaViewController.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSBankMcp.h"
@interface MSXunzeXinYongKaViewController : UIViewController
@property(nonatomic,copy)void(^gehuanka)(MSBankMcp * bakMcp);
@end
