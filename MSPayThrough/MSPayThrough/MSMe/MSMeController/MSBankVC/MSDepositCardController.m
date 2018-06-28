//
//  MSDepositCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDepositCardController.h"
#import "MSDepositCell.h"

@interface MSDepositCardController ()<UITableViewDelegate,UITableViewDataSource,MSDepositCellDelegate>
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation MSDepositCardController

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
    tableView.rowHeight = 150;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
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
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewOnlineLessonData)];
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    //上拉加载
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreOnlineLessonData)];
}

//- (void)loadNewOnlineLessonData{
//
//    //    YCLog(@"_selectDate-%@",_selectDate);
//    self.pageIndex = 1;
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    //    params[@"pageIndex"] = @(self.pageIndex);
//    //    params[@"pageSize"] = @(10);
//    params[@"time"] = _selectDate;
//    [YCHttpTool post:getOnlineListURL params:params success:^(id responseObj) {
//
//        YCLog(@"在线小班课-%@",responseObj);
//
//        if ([responseObj[@"Status"] isEqual:@(1)]) {
//            //下拉刷新时，清空数组数据改变已选择课程数量
//            [self.selectCourses removeAllObjects];
//            _orderView.countLabel.text = [NSString stringWithFormat:@"已选择  %zd  节课",self.selectCourses.count];
//            if (self.selectCourses.count > 0) {
//                self.orderView.hidden = NO;
//            }else{
//                self.orderView.hidden = YES;
//            }
//
//            [self.onlineLesssons removeAllObjects];
//            NSArray *onlineLesssons = [RBCOnlineLesson mj_objectArrayWithKeyValuesArray:responseObj[@"Data"]];
//            [self.onlineLesssons addObjectsFromArray:onlineLesssons];
//            [self.tableView reloadData];
//
//        }else{
//            [MBProgressHUD showError:responseObj[@"Msg"] ToView:self.view];
//        }
//        [self.tableView.mj_header endRefreshing];
//    } failure:^(NSError *error) {
//        [self.tableView.mj_header endRefreshing];
//        [MBProgressHUD showError:@"网络忙请稍后" ToView:self.view];
//    }];
//}


- (void)clickAddBankBtn{
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MSDepositCell *depositCell = [MSDepositCell depositCell];
    depositCell.delegate = self;
    
    return depositCell;
    
}

#pragma mark - MSDepositCellDelegate
- (void)clickDeleteButton:(MSDepositCell *)depositCell{
    LFLog(@"点击删除按钮");
}


@end
