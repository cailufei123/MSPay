//
//  MSNticeController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSNticeController.h"
#import "MSNoticeCell.h"

@interface MSNticeController ()

@end

@implementation MSNticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"公告";
    self.tableView.backgroundColor = RGBCOLOR(238, 238, 238);
    self.tableView.rowHeight = 95;
    [self setupRefresh];
}
- (void)setupRefresh{
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewNoticeData)];
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    //上拉加载
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreOnlineLessonData)];
}

//- (void)loadNewNoticeData{
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

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MSNoticeCell *noticeCell = [MSNoticeCell noticeCell];
    return noticeCell;
    
}




@end
