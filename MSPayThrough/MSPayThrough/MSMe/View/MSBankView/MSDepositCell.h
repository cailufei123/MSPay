//
//  MSDepositCell.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSDepositCell;
#import "MSDepositModel.h"

@protocol MSDepositCellDelegate<NSObject>

- (void)clickDeleteButton:(MSDepositCell *)depositCell;

- (void)clickCardTypeButon:(MSDepositCell *)depositCell;

@end

@interface MSDepositCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath *indexpath;

@property (nonatomic,weak) id<MSDepositCellDelegate> delegate;

@property (nonatomic,strong) MSDepositModel *deposit;
+ (instancetype)depositCell;

@end
