//
//  MSHomeTableTopView.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHomeTableTopView.h"
#import "JhtVerticalMarquee.h"
#import "JhtHorizontalMarquee.h"
#import "MSTopCollectionViewCell.h"
#import "MSCollectionViewFlowLayout.h"
#import "MSHomModel.h"
#import "MSDetalsViewController.h"
@interface MSHomeTableTopView()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
{
    // 水平滚动的跑马灯
    JhtHorizontalMarquee *_horizontalMarquee;
    
    // 上下滚动的跑马灯
    JhtVerticalMarquee *_verticalMarquee;
    // 是否暂停了上下滚动的跑马灯
    BOOL _isPauseV;
   
}

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIView *nitView;

@property (weak, nonatomic) IBOutlet UIView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *controlView;
@property (strong, nonatomic)  UICollectionView *collectionView;
@property (strong, nonatomic)  NSMutableArray * titles;
@end
static NSString * const cellid = @"MSTopCollectionViewCell";
@implementation MSHomeTableTopView
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self creaveHorseRaceLamp];
      [self setCreatCollection];
   
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
   
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
    _verticalMarquee.sourceArray = self.titles;
}
/** 添加上下滚动的跑马灯 */
-(void)creaveHorseRaceLamp{
  
    _verticalMarquee = [[JhtVerticalMarquee alloc]  initWithFrame:CGRectMake(35, 0, LFscreenW - 45, 30)];
    [self.nitView addSubview:_verticalMarquee];
    //    _verticalMarquee.backgroundColor = [UIColor clearColor];
    [_verticalMarquee layercornerRadius:16];
    _verticalMarquee.verticalTextColor = blackBColor;
    _verticalMarquee.scrollDelay = 5;
    _verticalMarquee.scrollDuration = 0;
    _verticalMarquee.verticalNumberOfLines = 1;
        _verticalMarquee.verticalTextFont = [UIFont systemFontOfSize:12];
                NSArray *soureArray = @[@"1. 谁曾从谁的青春里走过，留下了笑靥",
                                        @"2. 谁曾在谁的花季里停留，温暖了想念",
                                        @"3. 谁又从谁的雨季里消失，泛滥了眼泪",
                                        @"4. 人生路，路迢迢，谁道自古英雄多寂寥，若一朝，看透了，一身清风挣多少"
                                        ];
    
    NSString *str = @"谁曾在谁的花季里停留，温暖了想念";
    // 创建NSMutableAttributedString
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:str];
    // 设置字体和设置字体的范围
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30.0f] range:NSMakeRange(0, 3)];
    // 添加文字颜色
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(4, 2)];
    // 添加文字背景颜色
    [attrStr addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(7, 2)];
    // 添加下划线
    [attrStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(11, 5)];
    
    
    
    [_verticalMarquee scrollWithCallbackBlock:^(JhtVerticalMarquee *view, NSInteger currentIndex) {
       
    }];
    
    // 开始滚动
    [_verticalMarquee marqueeOfSettingWithState:MarqueeStart_V];
    //    WishWinListModel * winListModel = [_wishPoolModel.winDatas firstObject];
    //    [iamgeView sd_setImageWithURL:[NSURL URLWithString:winListModel.icon] placeholderImage:[UIImage imageNamed:@""]];
    // 给跑马灯添加点击手势
    UITapGestureRecognizer *vtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(verticalMarqueeTapGes:)];
    [_verticalMarquee addGestureRecognizer:vtap];
}

- (void)verticalMarqueeTapGes:(UITapGestureRecognizer *)ges {
    NSLog(@"点击第 %ld 条数据啦啊！！！", _verticalMarquee.currentIndex);
    
  
    
}

+(instancetype)loadNameHomeTableTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (IBAction)jihuaBtClick:(id)sender {
    
    
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
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
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
