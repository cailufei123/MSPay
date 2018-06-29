//
//  RBCShareView.h
//  JapanVillage
//
//  Created by ribencun on 2018/3/16.
//  Copyright © 2018年 ribencun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RBCShareView;

typedef enum : NSUInteger {
    ShareViewType_WXFriend,
    ShareViewType_WXFriendCircle,
    ShareViewType_Qzone,
    ShareViewType_QQ
} ShareViewType;

@protocol RBCShareViewDelegate <NSObject>
@optional
//点击取消按钮
- (void)shareViewClickCancleBtn:(RBCShareView *)shareView;
//点击分享按钮
- (void)shareViewClickShareBtn:(RBCShareView *)shareView;

@end

@interface RBCShareView : UIView

+ (instancetype)sharView;

//分享的view
@property (strong, nonatomic) IBOutlet UICollectionView *shareCollectionView;

@property (nonatomic,assign) id <RBCShareViewDelegate> delegate;
@property (nonatomic,assign) ShareViewType shareViewType;

@end
