//
//  MSCreditCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCreditCardController.h"
#import "MSCreditCell.h"

@interface MSCreditCardController ()<UITableViewDelegate,UITableViewDataSource,MSCreditCellDelegate>
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation MSCreditCardController

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
    tableView.rowHeight = 150;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
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
    dict[@"command"] = @"1009";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
            LFLog(@"信用卡-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [MBManager showscuess:@"绑定成功"];
           
        }else{
            [MBManager showBriefAlert:@"绑定失败"];
            
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}


- (void)clickAddBankBtn{
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MSCreditCell *creditCell = [MSCreditCell creditCell];
    creditCell.delegate = self;
    
    return creditCell;
    
}
#pragma mark - MSCreditCellDelegate
- (void)clickDeleteButton:(MSCreditCell *)creditCell{
    LFLog(@"点击删除按钮");
}

@end
