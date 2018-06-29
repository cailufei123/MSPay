//
//  MSHuanKuanPlayCell.h
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSHuanKuanPlayCell : UITableViewCell
@property(nonatomic,strong)  MSHomModel * homeModel ;
@property(nonatomic,copy)void(^skipDetailsVc)(MSHomModel* homModel);
@property(nonatomic,copy)void(^cacnlJihuaVc)(MSHomModel* homModel);
@end
