//
//  MSHuanKuanPlayViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHuanKuanPlayViewController.h"
#import "YWMeTopButton.h"

#import "MSHuanKuanPlayCell.h"
#import "MSDetalsViewController.h"
#import "MSShaiXuanViewAlertView.h"
@interface MSHuanKuanPlayViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UISearchBarDelegate>
@property(nonatomic,strong)YWMeTopButton * selectButton;
@property(nonatomic,strong)UIView * selectView;
@property(nonatomic,strong)NSMutableArray * billLists;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,assign)NSInteger  page;
@property(nonatomic,strong)NSString * qrp_status;
@property (assign, nonatomic) BOOL  isStart;
@property(nonatomic,strong)MSShaiXuanViewAlertView * shaiXuanViewAlertView;

@end
static NSString * const  cellidenfder = @"MSHuanKuanPlayCell";
@implementation MSHuanKuanPlayViewController
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"nodata_icon"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"无搜索结果";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:blackTextColor
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return 30.0f;
}
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    
    return self.isStart;
}
// 或者，返回固定值
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -100;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"还款计划";
    self.selectView = [[UIView alloc] initWithFrame:CGRectMake(0, kTopHeight, LFscreenW, 40)];
    self.selectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.selectView];
    YWMeTopButton * butt = [[YWMeTopButton alloc] initWithFrame:CGRectMake(15, 0, LFscreenW-200, 40)];
    butt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.selectButton = butt;
    [butt setTitleColor:deepGrayColor forState:UIControlStateNormal];
    [butt setTitle:@"全部" forState:UIControlStateNormal];
      [butt setImage:[UIImage imageNamed:@"select_down_arrow"] forState:UIControlStateNormal];
      [butt setImage:[UIImage imageNamed:@"select_up_arrow"] forState:UIControlStateSelected];
    butt.titleLabel.font = [UIFont systemFontOfSize:13];
    [butt addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView addSubview:butt];
    [self setTable ];
    [self createRefresh ];
    self.qrp_status = @"0";
    [self loadNewData];
  
}
-(void)selectClick:(YWMeTopButton * )button{
    if (button.selected == YES) {
        button.selected =NO;
         [GKCover hide];
    }else{
        WeakSelf(weakSelf)
          button.selected =YES;
        self.shaiXuanViewAlertView = [[MSShaiXuanViewAlertView alloc] init];
        self.shaiXuanViewAlertView.shaixuan = ^(UIButton *button) {
             [GKCover hide];
              weakSelf.qrp_status = [NSString stringWithFormat:@"%ld",button.tag];
            [weakSelf loadNewData];
        };
        
        self.shaiXuanViewAlertView.backgroundColor = [UIColor whiteColor];
        self.shaiXuanViewAlertView.clf_size = CGSizeMake(LFscreenW, 80);
        
        [GKCover coverFrom:self.tableView contentView:  self.shaiXuanViewAlertView  style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleTop showAnimStyle:GKCoverShowAnimStyleNone hideAnimStyle:GKCoverHideAnimStyleNone notClick:NO showBlock:nil hideBlock:^{
             button.selected =NO;
        }];
        
    }
//    [GKCover hide];
 
//     self.shaiXuanViewAlertView.clf_y = kTopHeight+40;
}
- (void)createRefresh
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 马上进入刷新状态
    //    [header beginRefreshing];
    //    // 设置header
    self.tableView.mj_header = header;
        self.tableView.mj_footer = footer;
}
-(void)loadNewData{

    NSMutableDictionary * registUserDict =diction;
    registUserDict[@"qrp_status"] =  self.qrp_status ;
    registUserDict[@"size"] =  @"20";
    registUserDict[@"command"] = @"3004";
    registUserDict[@"start"] = @(self.page);
    
    [YWRequestData playRepaymentDict:registUserDict success:^(id responseObj) {
        self.billLists = [MSHomModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"qrp_list"]];
        [self.tableView reloadData];
        if ( self.billLists.count<=20) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        self.isStart = self.billLists.count>0?NO:YES;
        [self.tableView reloadEmptyDataSet];
        [self.tableView.mj_header endRefreshing];
    }];
    
   
}
-(void)loadMoreData{
    self.page ++;
    NSMutableDictionary * registUserDict =diction;
    registUserDict[@"qrp_status"] =  self.qrp_status ;
    registUserDict[@"size"] =  @"20";
    registUserDict[@"command"] = @"3004";
    registUserDict[@"start"] = @(self.page);
    
    [YWRequestData playRepaymentDict:registUserDict success:^(id responseObj) {
        NSMutableArray * arr= [MSHomModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"qrp_list"]];
        [self.billLists addObjectsFromArray:arr];
        [self.tableView reloadData];
        if (arr.count<=0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        [self.tableView.mj_footer endRefreshing];
    }];
}
-(void)setTable{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0,  self.selectView.clf_bottom, LFscreenW, LFscreenH-self.selectView.clf_bottom) style:UITableViewStylePlain];
    [self.view  addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor  =bagColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:cellidenfder bundle:nil] forCellReuseIdentifier:cellidenfder];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    if (@available(iOS 11.0, *)) {
        
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return    self.billLists .count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 195;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeakSelf(weakSelf)
    MSHomModel * homeModel =   self.billLists [indexPath.row];
    MSHuanKuanPlayCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    cell.homeModel = homeModel;
    cell.skipDetailsVc = ^(MSHomModel *homModel) {
        MSDetalsViewController * detal = [[MSDetalsViewController alloc] init];
        detal.homeModel = homeModel;
        [weakSelf.navigationController pushViewController:detal animated:YES];
    
    };
    cell.cacnlJihuaVc = ^(MSHomModel *homModel) {
        NSMutableDictionary * registUserDict =diction;
        registUserDict[@"qrp_id"] =  homModel.qrp_id ;
        registUserDict[@"command"] = @"3003";
        [YWRequestData publicDict:registUserDict success:^(id responseObj) {
            [self loadNewData];
        }];
    };
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
