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
        [self.playRepayments addObject:self.playRepayments.firstObject];
        [self.playRepayments insertObject:self.playRepayments.lastObject atIndex:0];
        if (self.playRepayments.count <= 0) {
            [self.playRepayments removeAllObjects];
            MSHomModel * homModel = [[MSHomModel alloc] init];
            homModel.qrp_repay_money_finished =@"3860000";
                 homModel.version=@"6";
                 homModel.mbi_id=@"300117";
                 homModel.qrp_repay_count=@"4";
                 homModel.qrp_repay_date=@"2018-05-22,2018-05-23";
                 homModel.qrp_repay_money_fee_total=@"30494";
                 homModel.qrp_status=@"3";
                 homModel.qrp_create_time=@"2018-05-19 19:22:15";
                 homModel.qrp_repay_money_total=@" 3860000";
                 homModel.qrp_repay_day_count=@"2";
                 homModel.qrp_plan_cycle=@"2018-05-22~2018-05-23";
                 homModel.qrp_id=@"100051";
                 homModel.qrp_update_time=@"2018-05-23 13:00:00";
                 homModel.qrp_repay_day=@"25";
                 homModel.qrp_bill_day=@"07";
                 homModel.mbi_code=@"M1805154690350651855";
                 homModel.qrp_reserve_money=@"1111694";
                 homModel.qrp_credit_card_no=@" 6225758308116622";
                 homModel.qrp_repay_money_fee_pay_total=@"400";
              [self.playRepayments addObject:homModel];
              [self.playRepayments addObject:homModel];
              [self.playRepayments addObject:homModel];
             [self.playRepayments addObject:homModel];
             [self.playRepayments addObject:homModel];
            
        }
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
        if (self.billLists.count <= 0) {
            [self.billLists removeAllObjects];
            MSHomListModel * homModel = [[MSHomListModel alloc] init];
            
            
            
            
              homModel.tm_settlement_time=@"2018-05-23 11:10:00";
              homModel.tm_transaction_money_amount=@"1080900";
              homModel.tm_transaction_fee_01=@"8608";
              homModel.tm_pwd_situation=@"1";
              homModel.tm_cs_method=@"1";
              homModel.tm_transaction_fee_02=@"0";
              homModel.mbi_code=@"M1805154690350651855";
              homModel.tm_transaction_money=@"1089508";
              homModel.tm_create_time=@"2018-05-23 11:10:00";
              homModel.tm_sign=@"300117";
              homModel.tm_terminal_type=@"1";
              homModel.mbi_name=@"300117";
              homModel.tm_serial_no=@"101318051915267289359491";
              homModel.version=@"300117";
              homModel.tm_transaction_type_01=@"300117";
              homModel.tcq_id=@"100004";
              homModel.tm_transaction_type_02=@"300117";
              homModel.tm_card_type=@"300117";
              homModel.tm_trade_time=@"2018-05-23 11:10:00";
              homModel.tiq_id=@"300117";
              homModel.tm_remark=@"300117";
              homModel.tm_terminal_num=@"300117";
              homModel.tm_serial_no_bank=@"999125263649492994";
              homModel.tm_card_no=@"6225758308116622";
              homModel.tm_origin=@"150";
              homModel.tm_bussiness_time=@"2018-05-23 11:10:00";
              homModel.mbi_id=@"300117";
              homModel.tm_transaction_status=
              homModel.tm_update_time=@"2018-05-23 11:10:15";
           
            [self.billLists addObject:homModel];
            [self.billLists addObject:homModel];
          
        }
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
   
  
}




@end
