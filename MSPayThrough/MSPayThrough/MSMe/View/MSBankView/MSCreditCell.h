//
//  MSCreditCell.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSCreditCell;

@protocol MSCreditCellDelegate<NSObject>

- (void)clickDeleteButton:(MSCreditCell *)creditCell;

@end

@interface MSCreditCell : UITableViewCell

@property (nonatomic,weak) id<MSCreditCellDelegate> delegate;

+ (instancetype)creditCell;

@end
