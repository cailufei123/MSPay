//
//  MSCreditCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCreditCardController.h"
#import "MSCreditCell.h"
#import "MSAddCreditCardController.h"
#import "MSBankMcp.h"
#import "YCAlertViewController.h"

@interface MSCreditCardController ()<UITableViewDelegate,UITableViewDataSource,MSCreditCellDelegate>
@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *mcps;
@end

@implementation MSCreditCardController

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
    
    
    //初始化tableview
    [self setUpTableView];
    //初始化view
    [self setUpView];
}

- (void)setUpTableView{
    CGFloat tableViewH = LFscreenH - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT - 44 - 50;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, LFscreenW, tableViewH) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 180;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self setupRefresh];
}

- (void)setUpView{
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    addButton.frame = CGRectMake(45, LFscreenH - 20 - 50 - NAVIGATION_BAR_HEIGHT - 44, LFscreenW - 90, 50);
    [addButton setTitle:@"添加信用卡" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(clickAddBankBtn) forControlEvents:UIControlEventTouchUpInside];
    [addButton gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 50) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    [self.view addSubview:addButton];
}

- (void)setupRefresh{
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewCreditCardData)];
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    //上拉加载
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreOnlineLessonData)];
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
    MSCreditCell *creditCell = [MSCreditCell creditCell];
    creditCell.delegate = self;
    creditCell.indexpath = indexPath;
    creditCell.mcp = mcp;

    return creditCell;
    
}
#pragma mark - MSCreditCellDelegate
- (void)clickDeleteButton:(MSCreditCell *)creditCell{
//    LFLog(@"点击删除按钮");
    YCAlertViewController *alertVC = [YCAlertViewController alertControllerWithTitle:nil message:@"是否删除银行卡"];
    YCAlertAction *cancel = [YCAlertAction actionWithTitle:@"取消" handler:^(YCAlertAction *action) {
    }];
    YCAlertAction *sure = [YCAlertAction actionWithTitle:@"确定" handler:^(YCAlertAction *action) {
        NSMutableDictionary * dict = diction;
        dict[@"mcp_id"] = creditCell.mcp.mcp_id;
        dict[@"command"] = @"1008";
        
        [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
        } success:^(id responseObj) {
            
            //        LFLog(@"responseObj-%@",responseObj);
            if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
                [MBManager showBriefAlert:@"删除信用卡成功"];
                
                [self.tableView reloadData];
                [self.tableView.mj_header beginRefreshing];
                
            }else{
                
            }
            
        } failure:^(NSError *error) {
            //        [MBManager showBriefAlert:@"网络错误"];
            
            [MBManager hideAlert];
        }];
    }];
    
    [alertVC addAction:cancel];
    [alertVC addAction:sure];
    
    [self presentViewController:alertVC animated:NO completion:nil];
 
}

@end
