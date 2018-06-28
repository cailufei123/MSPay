//
//  MSDepositCell.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSDepositCell;

@protocol MSDepositCellDelegate<NSObject>

- (void)clickDeleteButton:(MSDepositCell *)depositCell;

@end

@interface MSDepositCell : UITableViewCell

@property (nonatomic,weak) id<MSDepositCellDelegate> delegate;

+ (instancetype)depositCell;

@end
