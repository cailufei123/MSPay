//
//  MSCreditCell.h
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSCreditCell,MSBankMcp;

@protocol MSCreditCellDelegate<NSObject>

- (void)clickDeleteButton:(MSCreditCell *)creditCell;

@end

@interface MSCreditCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath *indexpath;

@property (nonatomic,weak) id<MSCreditCellDelegate> delegate;
//背景view
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic,strong) MSBankMcp *mcp;
+ (instancetype)creditCell;

@end
