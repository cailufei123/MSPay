//
//  MSXunzeXinYongKaViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSXunzeXinYongKaViewController.h"
#import "MSCreditCell.h"
#import "MSAddCreditCardController.h"
#import "MSBankMcp.h"
@interface MSXunzeXinYongKaViewController ()<UITableViewDelegate,UITableViewDataSource,MSCreditCellDelegate>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *mcps;
@end
static NSString * const  cellidenfder = @"MSCreditCell";
@implementation MSXunzeXinYongKaViewController

- (NSMutableArray *)mcps{
    if (!_mcps) {
        _mcps = [NSMutableArray array];
    }
    return _mcps;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择信用卡";
      [self setTable];
     [self createRefresh];
 
}


-(void)setTable{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
   
      self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  kTopHeight, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
    [self.view  addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor  =bagColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:cellidenfder bundle:nil] forCellReuseIdentifier:cellidenfder];
    self.tableView.rowHeight = 180;
    if (@available(iOS 11.0, *)) {
        
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    
}

- (void)createRefresh
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewCreditCardData)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header = header;
  
}

- (void)loadNewCreditCardData{
    
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"1";
    dict[@"command"] = @"1006";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        //        LFLog(@"信用卡-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
            [self.mcps removeAllObjects];
            
            NSArray *mcps = [MSBankMcp mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"mcp"]];
            
            [self.mcps addObjectsFromArray:mcps];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        }else{
            
            [self.tableView.mj_header endRefreshing];
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [self.tableView.mj_header endRefreshing];
        [MBManager hideAlert];
    }];
}


- (void)clickAddBankBtn{
    MSAddCreditCardController *addVc = [[MSAddCreditCardController alloc] init];
    [self.navigationController pushViewController:addVc animated:YES];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mcps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MSBankMcp *mcp = self.mcps[indexPath.row];
       MSCreditCell * creditCell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
 
    creditCell.delegate = self;
    creditCell.indexpath = indexPath;
    creditCell.mcp = mcp;
    
    return creditCell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      MSBankMcp *mcp = self.mcps[indexPath.row];
    self.gehuanka(mcp);
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - MSCreditCellDelegate
- (void)clickDeleteButton:(MSCreditCell *)creditCell{
    //    LFLog(@"点击删除按钮");
    NSMutableDictionary * dict = diction;
    dict[@"mcp_id"] = creditCell.mcp.mcp_id;
    dict[@"command"] = @"1008";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"删除卡-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
            [self.mcps removeAllObjects];
            
            NSArray *mcps = [MSBankMcp mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"mcp"]];
            
            [self.mcps addObjectsFromArray:mcps];
            [self.tableView reloadData];
            [self.tableView.mj_header beginRefreshing];
            
        }else{
            
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        
        [MBManager hideAlert];
    }];
}

@end
