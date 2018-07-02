//
//  MSHomeTableTopView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHomeTableTopView.h"

#import "MSTopCollectionViewCell.h"
#import "MSCollectionViewFlowLayout.h"
#import "MSDetalsViewController.h"
#import "MSHuanKuanPlayViewController.h"
#import "MSLiuShuiSelectViewController.h"
#import "SDCycleScrollView.h"
@interface MSHomeTableTopView()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,SDCycleScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIView *nitView;

@property (weak, nonatomic) IBOutlet UIView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *controlView;
@property (strong, nonatomic)  UICollectionView *collectionView;
@property (strong, nonatomic)  NSMutableArray * titles;
@property (weak, nonatomic) IBOutlet UIButton *liuShuiBt;
@property (strong, nonatomic)SDCycleScrollView *cycleScrollView;
@end
static NSString * const cellid = @"MSTopCollectionViewCell";
@implementation MSHomeTableTopView
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self creaveHorseRaceLamp];
      [self setCreatCollection];
   
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self.liuShuiBt addTarget:self action:@selector(liuShuiBtClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)liuShuiBtClick{
    MSLiuShuiSelectViewController * serviceAgreementVc = [[MSLiuShuiSelectViewController alloc] init];
    [[self viewController].navigationController pushViewController:serviceAgreementVc animated:YES];
    
}
-(NSMutableArray *)titles{
    if (!_titles) {
        _titles = [NSMutableArray array];
    }
    return _titles;
}
-(void)setArrar:(NSMutableArray *)arrar{
    [self.titles removeAllObjects];

    for (GongGaoModel * gongGaoModel in arrar) {
        [self.titles addObject:gongGaoModel.cn_content];
    }

     self.cycleScrollView .titlesGroup = self.titles;
}
/** 添加上下滚动的跑马灯 */
-(void)creaveHorseRaceLamp{
  
    
    
    // 网络加载 --- 创建只上下滚动展示文字的轮播器
    // 由于模拟器的渲染问题，如果发现轮播时有一条线不必处理，模拟器放大到100%或者真机调试是不会出现那条线的
    SDCycleScrollView *cycleScrollView4 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(35, 0, LFscreenW - 45, 30) delegate:self placeholderImage:nil];
    cycleScrollView4.backgroundColor = [UIColor whiteColor];
    self.cycleScrollView = cycleScrollView4;
    cycleScrollView4.scrollDirection = UICollectionViewScrollDirectionVertical;
    cycleScrollView4.onlyDisplayText = YES;

    cycleScrollView4.titleLabelBackgroundColor = [UIColor whiteColor];
     cycleScrollView4.titleLabelTextColor = blackBColor;
    [cycleScrollView4 disableScrollGesture];
    
   
//      [_verticalMarquee addGestureRecognizer: self.cycleScrollView ];
    
     [self.nitView addSubview:cycleScrollView4];
    
    
    
    
    
    
    
    
   
}

+(instancetype)loadNameHomeTableTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (IBAction)jihuaBtClick:(id)sender {
    
    MSHuanKuanPlayViewController * serviceAgreementVc = [[MSHuanKuanPlayViewController alloc] init];
    [[self viewController].navigationController pushViewController:serviceAgreementVc animated:YES];
}
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

-(void)setPlayRepayments:(NSMutableArray *)playRepayments{
    
    _playRepayments = playRepayments;
    [self.collectionView reloadData];
}
-(void)setCreatCollection{
    MSCollectionViewFlowLayout *layout = [[MSCollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, LFscreenW, 150) collectionViewLayout:layout];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
   self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
        [self.scrollView addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MSTopCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:cellid];
//    self.collectionView.contentInset = UIEdgeInsetsMake(0, 22, 0, 10);
    self.collectionView.alwaysBounceHorizontal = YES;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _playRepayments.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MSHomModel * homeModel = _playRepayments[indexPath.row];
    MSTopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    cell.homeModel = homeModel;
   
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
      MSHomModel * homeModel = _playRepayments[indexPath.row];
    MSDetalsViewController * detal = [[MSDetalsViewController alloc] init];
    detal.homeModel = homeModel;
    [[self viewController].navigationController pushViewController:detal animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX =  scrollView.contentOffset.x;
//     _oldPoint = scrollView.contentOffset.x;
//    self.collectionView.userInteractionEnabled = NO;
//    if (!self._playRepayments.count) return; // 解决清除timer时偶尔会出现的问题
    self.pageControl.currentPage = offsetX/LFscreenW;
}
@end
