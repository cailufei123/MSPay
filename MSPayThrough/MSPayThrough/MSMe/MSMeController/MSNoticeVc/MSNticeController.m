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
    

}

- (void)loadNewNoticeData{

    NSMutableDictionary * dict = diction;
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"公告-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
        }
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MSNoticeCell *noticeCell = [MSNoticeCell noticeCell];
    return noticeCell;
    
}




@end
