//
//  MSZhiHuiHuanKuanViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSZhiHuiHuanKuanViewController.h"
#import "YWMeTopButton.h"

#import "MSHuanKuanPlayCell.h"
#import "MSDetalsViewController.h"
#import "MSShaiXuanViewAlertView.h"
#import "MSZhiHuiTableViewCell.h"
#import "MSBankMcp.h"
@interface MSZhiHuiHuanKuanViewController ()

<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UISearchBarDelegate>
@property(nonatomic,strong)YWMeTopButton * selectButton;
@property(nonatomic,strong)UIView * selectView;
@property(nonatomic,strong)NSMutableArray * billLists;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,assign)NSInteger  page;
@property(nonatomic,strong)NSString * qrp_status;
@property (assign, nonatomic) BOOL  isStart;
@property(nonatomic,strong)MSShaiXuanViewAlertView * shaiXuanViewAlertView;

@end
static NSString * const  cellidenfder = @"MSZhiHuiTableViewCell";
@implementation MSZhiHuiHuanKuanViewController
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
    self.navigationItem.title = @"智慧还款";
    [self setTable ];
    [self createRefresh ];
    [self loadNewData];
    
}

- (void)createRefresh
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
  
    self.tableView.mj_header = header;
  
}
-(void)loadNewData{
    
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"1";
    dict[@"command"] = @"1006";
    
    [YWRequestData playRepaymentDict:dict success:^(id responseObj) {
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
          
            self.billLists = [MSBankMcpModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"mcp"]];
            [self.tableView reloadData];
            if ( self.billLists.count<=20) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            self.isStart = self.billLists.count>0?NO:YES;
            [self.tableView reloadEmptyDataSet];
            [self.tableView.mj_header endRefreshing];
        }else{
            
            [self.tableView.mj_header endRefreshing];
        }
       
    }];
    
    
   
}

-(void)setTable{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0,  kTopHeight, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
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
    
    return 170;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeakSelf(weakSelf)
    MSBankMcpModel * bankMcp =   self.billLists [indexPath.row];
    MSZhiHuiTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    cell.bankMcp = bankMcp;
    cell.indexpath = indexPath;
//    cell.skipDetailsVc = ^(MSHomModel *homModel) {
//        MSDetalsViewController * detal = [[MSDetalsViewController alloc] init];
//        detal.homeModel = homeModel;
//        [weakSelf.navigationController pushViewController:detal animated:YES];
//
//    };
//    cell.cacnlJihuaVc = ^(MSHomModel *homModel) {
//        NSMutableDictionary * registUserDict =diction;
//        registUserDict[@"qrp_id"] =  homModel.qrp_id ;
//        registUserDict[@"command"] = @"3003";
//        [YWRequestData publicDict:registUserDict success:^(id responseObj) {
//            [self loadNewData];
//        }];
//    };
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
@end
