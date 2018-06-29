//
//  MSBillViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSBillViewController.h"
#import "MSHomeTableViewCell.h"
@interface MSBillViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * billLists;
@property(nonatomic,assign)NSInteger  page;
@end
static NSString * const  cellidenfder = @"MSHomeTableViewCell";
@implementation MSBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"账单";
    [self setTable ];
    [self createRefresh ];
    [self topView];
    self.page = 0;
     [self loadNewData];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    
}
-(void)topView{
    
  
    UIView * oneVew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LFscreenW, kTopHeight)];
    [oneVew gradientFreme:oneVew.frame startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 1, 200, 20)];
    lable.text = @"谊付通"; lable.textColor = [UIColor whiteColor]; lable.font = [UIFont systemFontOfSize:14];
    [oneVew addSubview:lable];
    lable.clf_bottom = kTopHeight-10;
    [self.view addSubview:oneVew];
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
    NSMutableDictionary * billListDict =diction;
    billListDict[@"mcp_id"] = @"n999999";
    billListDict[@"mcp_card_no"] = @"n999999";
    billListDict[@"start_time"] = @"999999";
    billListDict[@"end_time"] = @"999999";
    billListDict[@"start"] = @(self.page);
    billListDict[@"size"] = @"20";
    billListDict[@"command"] = @"1013";
    [YWRequestData billListDict:billListDict success:^(id responseObj) {
        self.billLists = [MSHomListModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"tm_list"]];
         [self.tableView reloadData];
        if ( self.billLists.count<=20) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
       
        [self.tableView.mj_header endRefreshing];
    }];
}
-(void)loadMoreData{
    self.page ++;
    NSMutableDictionary * billListDict =diction;
    billListDict[@"mcp_id"] = @"n999999";
    billListDict[@"mcp_card_no"] = @"n999999";
    billListDict[@"start_time"] = @"999999";
    billListDict[@"end_time"] = @"999999";
    billListDict[@"start"] = @(self.page);
    billListDict[@"size"] = @"20";
    billListDict[@"command"] = @"1013";
    [YWRequestData billListDict:billListDict success:^(id responseObj) {
        NSMutableArray * arr= [MSHomListModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"tm_list"]];
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
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, LFscreenW, LFscreenH-kTopHeight-kTabBarHeight) style:UITableViewStylePlain];
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
    
    
}



@end
