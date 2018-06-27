//
//  MSCollectionViewFlowLayout.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCollectionViewFlowLayout.h"

@implementation MSCollectionViewFlowLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(LFscreenW, 150);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //同一行相邻两个cell的最小间距
        self.minimumInteritemSpacing = 0;
        //最小两行之间的间距
        self.minimumLineSpacing = 10;
    }
    return self;
}
@end
