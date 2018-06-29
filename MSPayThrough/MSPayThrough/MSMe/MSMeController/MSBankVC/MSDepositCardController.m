//
//  MSDepositCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDepositCardController.h"
#import "MSDepositCell.h"
#import "MSAddDepositCardController.h"
#import "MSDepositModel.h"

@interface MSDepositCardController ()<UITableViewDelegate,UITableViewDataSource,MSDepositCellDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *deposits;
@end

@implementation MSDepositCardController
- (NSMutableArray *)deposits{
    if (!_deposits) {
        _deposits = [NSMutableArray array];
    }
    return _deposits;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(238,238,238);
    
    //初始化tableview
    [self setUpTableView];
    //初始化view
    [self setUpView];
}

- (void)setUpTableView{
    CGFloat tableViewH = LFscreenH - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT - 44 - 50;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, LFscreenW, tableViewH) style:UITableViewStylePlain];
    tableView.backgroundColor = RGBCOLOR(238, 238, 238);
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
    [addButton setTitle:@"添加储蓄卡" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(clickAddBankBtn) forControlEvents:UIControlEventTouchUpInside];
    [addButton gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 50) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    [self.view addSubview:addButton];
}

- (void)setupRefresh{
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDepositData)];
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];

}

- (void)loadNewDepositData{

    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"2";
    dict[@"command"] = @"1006";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
//        LFLog(@"储蓄卡卡-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
            [self.deposits removeAllObjects];

            NSArray *deposits = [MSDepositModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"mcp"]];

            [self.deposits addObjectsFromArray:deposits];
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
    MSAddDepositCardController *addDepositVc = [[MSAddDepositCardController alloc] init];
    [self.navigationController pushViewController:addDepositVc animated:YES];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.deposits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MSDepositCell *depositCell = [MSDepositCell depositCell];
    depositCell.delegate = self;
    depositCell.deposit = self.deposits[indexPath.row];
    depositCell.indexpath = indexPath;
    return depositCell;
    
}

#pragma mark - MSDepositCellDelegate
- (void)clickDeleteButton:(MSDepositCell *)depositCell{
    LFLog(@"点击删除按钮");
}
- (void)clickCardTypeButon:(MSDepositCell *)depositCell{
    LFLog(@"点击主卡");
}

@end
