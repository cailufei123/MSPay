//
//  MSBankController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSBankController.h"
#import "SGPagingView.h"
#import "MSCreditCardController.h"
#import "MSDepositCardController.h"

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)

@interface MSBankController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate,UINavigationBarDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end

@implementation MSBankController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = RGBCOLOR(238,238,238);
    self.navigationItem.title = @"银行卡";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSelectedIndex:) name:@"changeSelectedIndex" object:nil];
    
    //初始化基本信息
    [self setupPageView];
}
- (void)changeSelectedIndex:(NSNotification *)noti {
    _pageTitleView.resetSelectedIndex = [noti.object integerValue];
}

- (void)setupPageView{
    CGFloat pageTitleViewY = NAVIGATION_BAR_HEIGHT;
    NSArray *titleArr = @[@"信用卡", @"储蓄卡"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    // 说明：指示器额外增加的宽度，不设置，指示器宽度为标题文字宽度；若设置无限大，则指示器宽度为按钮宽度
    configure.indicatorAdditionalWidth = 10;
    configure.titleColor = RGBCOLOR(102, 102, 102);
    configure.titleSelectedColor = RGBCOLOR(242, 62, 76);
    configure.titleFont = [UIFont systemFontOfSize:14.0];
    configure.titleSelectedFont = configure.titleFont;
    configure.indicatorColor = RGBCOLOR(242, 62, 76);
    
    // pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, LFscreenW, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    //信用卡
    MSCreditCardController *cardVc = [[MSCreditCardController alloc] init];
    //储蓄卡
    MSDepositCardController *depositVc = [[MSDepositCardController alloc] init];

    NSArray *childArr = @[cardVc, depositVc];
    // pageContentView
    CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), LFscreenW, contentViewHeight) parentVC:self childVCs:childArr];
    _pageContentView.delegatePageContentView = self;
    
    [self.view addSubview:_pageContentView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageContentViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
