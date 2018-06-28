//
//  MSHomeViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSHomeViewController.h"
#import "MSHomeTopView.h"
#import "MSHomeTableViewCell.h"
#import "MSHomeTableTopView.h"
#import "MSHomModel.h"
#import "MSDetalsViewController.h"
@interface MSHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UISearchBarDelegate>
@property(nonatomic,strong) MSHomeTopView * homeTopView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)MSHomeTableTopView * homeTableTopView;
@property(nonatomic,strong)NSMutableArray * playRepayments;
@property(nonatomic,strong)NSMutableArray * billLists;
@end
static NSString * const  cellidenfder = @"MSHomeTableViewCell";
@implementation MSHomeViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
  
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeTopView = [MSHomeTopView loadNameHomeTopViewXib];
    self.homeTopView .frame = CGRectMake(0, 0, LFscreenW, 230+kStatusBarHeight);
    [self.view addSubview:self.homeTopView];
    self.view.backgroundColor = bagColor;
    [self setTable ];
    [self createRefresh ];
    [self loadNewData];
    
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
//    self.tableView.mj_footer = footer;
}
-(void)loadNewData{
    NSMutableDictionary * registUserDict =diction;
    registUserDict[@"qrp_status"] = @"0";
     registUserDict[@"size"] = @"3";
    registUserDict[@"command"] = @"3004";
     registUserDict[@"start"] = @"0";
   
    [YWRequestData playRepaymentDict:registUserDict success:^(id responseObj) {
        self.playRepayments = [MSHomModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"qrp_list"]];
        self.homeTableTopView.playRepayments = self.playRepayments;
        [self.tableView.mj_header endRefreshing];
    }];
    NSMutableDictionary * billListDict =diction;
    billListDict[@"mcp_id"] = @"n999999";
    billListDict[@"mcp_card_no"] = @"n999999";
    billListDict[@"start_time"] = @"999999";
    billListDict[@"end_time"] = @"999999";
    billListDict[@"start"] = @"0";
    billListDict[@"size"] = @"2";
    billListDict[@"command"] = @"1013";
    [YWRequestData billListDict:billListDict success:^(id responseObj) {
        self.billLists = [MSHomListModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"tm_list"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    NSMutableDictionary * gongGaoDict =diction;
    gongGaoDict[@"command"] = @"99007";
    [YWRequestData gongGaoDict:gongGaoDict success:^(id responseObj) {
        NSMutableArray * arrar = [GongGaoModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"cn_list"]];
        self.homeTableTopView.arrar = arrar;
    }];
    
    
}
-(void)loadMoreData{
    
}
-(void)setTable{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, self.homeTopView.clf_bottom+10, LFscreenW, LFscreenH-(self.homeTopView.clf_bottom+10)-kTabBarHeight) style:UITableViewStylePlain];
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
    self.homeTableTopView = [MSHomeTableTopView loadNameHomeTableTopViewXib];
    self.tableView.tableHeaderView = self.homeTableTopView ;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return  0 ;
    }else{
        return 0.01f;
    }
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return   self.billLists.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    MSHomListModel * listModel =  self.billLists[indexPath.row];
    MSHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    cell.listModel = listModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    MSDetalsViewController * detal = [[MSDetalsViewController alloc] init];
    [self.navigationController pushViewController:detal animated:YES];
}




@end
