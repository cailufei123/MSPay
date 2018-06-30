//
//  MSZhiHuiTableViewCell.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSBankMcp.h"
@interface MSZhiHuiTableViewCell : UITableViewCell
@property(nonatomic,strong) MSBankMcpModel * bankMcp;
@property (nonatomic,strong) NSIndexPath *indexpath;
@end
