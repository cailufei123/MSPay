//
//  MSselectChuxukaViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSselectChuxukaViewController.h"
#import "MSDepositCell.h"
#import "MSAddDepositCardController.h"
#import "MSDepositModel.h"
@interface MSselectChuxukaViewController ()<UITableViewDelegate,UITableViewDataSource,MSDepositCellDelegate>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *deposits;
@end
static NSString * const  cellidenfder = @"MSDepositCell";
@implementation MSselectChuxukaViewController

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
