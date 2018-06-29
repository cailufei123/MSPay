//
//  MSNoticeCell.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSNoticeModel.h"

@interface MSNoticeCell : UITableViewCell

+ (instancetype)noticeCell;

@property (nonatomic,strong) MSNoticeModel *notice;

@end
