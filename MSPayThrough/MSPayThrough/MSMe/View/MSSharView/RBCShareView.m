//
//  RBCShareView.m
//  JapanVillage
//
//  Created by ribencun on 2018/3/16.
//  Copyright © 2018年 ribencun. All rights reserved.
//

#import "RBCShareView.h"
#import "RBCShareCell.h"

static NSString *const shareCellId = @"shareCellId";

@interface RBCShareView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation RBCShareView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //xib里面的UIcollectionView，所以不需要再创建UIcollectionView和UICollectionViewFlowLayout，直接在xib里面设置即可
    //注册cell
    [self.shareCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RBCShareCell class]) bundle:nil] forCellWithReuseIdentifier:shareCellId];

}

+ (instancetype)sharView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    RBCShareCell *shareCell = [collectionView dequeueReusableCellWithReuseIdentifier:shareCellId forIndexPath:indexPath];
    shareCell.indexpath = indexPath;

    return shareCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.shareViewType = ShareViewType_WXFriend;
        [self shareViewClickShareBtn:self];
    }else if (indexPath.row == 1){
        self.shareViewType = ShareViewType_WXFriendCircle;
        [self shareViewClickShareBtn:self];
    }else if (indexPath.row == 2){
        self.shareViewType = ShareViewType_Qzone;
        [self shareViewClickShareBtn:self];
    }else{
        self.shareViewType = ShareViewType_QQ;
        [self shareViewClickShareBtn:self];
    }
}

//点击分享按钮
- (void)shareViewClickShareBtn:(RBCShareView *)shareView{
    if ([self.delegate respondsToSelector:@selector(shareViewClickShareBtn:)]) {
        [self.delegate shareViewClickShareBtn:self];
    }
   
}

#pragma mark - UICollectionViewDelegateFlowLayout
/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(LFscreenW/2,100);
}

//点击取消按钮
- (IBAction)clickCancleButton {
    
    if ([self.delegate respondsToSelector:@selector(shareViewClickCancleBtn:)]) {
        [self.delegate shareViewClickCancleBtn:self];
    }
    
}

@end
