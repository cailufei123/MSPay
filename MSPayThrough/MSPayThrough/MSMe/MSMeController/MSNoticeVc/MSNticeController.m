//
//  MSNticeController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSNticeController.h"
#import "MSNoticeCell.h"
#import "MSNoticeModel.h"

@interface MSNticeController ()
@property (nonatomic,strong) NSMutableArray *notices;
@end

@implementation MSNticeController

- (NSMutableArray *)notices{
    if (!_notices) {
        _notices = [NSMutableArray array];
    }
    return _notices;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"公告";
    self.tableView.backgroundColor = RGBCOLOR(238, 238, 238);
    self.tableView.rowHeight = 95;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self setupRefresh];
}
- (void)setupRefresh{
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewNoticeData)];
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    

}

- (void)loadNewNoticeData{

    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"99007";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"公告-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [self.notices removeAllObjects];
            
            NSArray *notices = [MSNoticeModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"cn_list"]];
            [self.notices addObjectsFromArray:notices];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        }else{
            [self.tableView.mj_header endRefreshing];
        }
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [MBManager hideAlert];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.notices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MSNoticeCell *noticeCell = [MSNoticeCell noticeCell];
    noticeCell.notice = self.notices[indexPath.row];
    return noticeCell;
    
}




@end
