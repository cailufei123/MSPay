//
//  MSCreditCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/27.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSCreditCardController.h"

@interface MSCreditCardController ()

@end

@implementation MSCreditCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(238,238,238);
    
    //初始化tableview
    [self setUpTableView];
    //初始化view
    [self setUpView];
}

- (void)setUpTableView{
//    CGFloat tableViewH = YCScreenH - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT - SGPageTitleViewH - _calendarHeightConstraint.constant;
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,_calendar.bottom + 10, YCScreenW, tableViewH) style:UITableViewStylePlain];
//    tableView.backgroundColor = YCGlobalBg;
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    tableView.rowHeight = 130;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.tableFooterView = [[UIView alloc] init];
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
}

- (void)setUpView{
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(45, LFscreenH - 20, LFscreenW - 90, 50);
    [addButton gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 50) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    [self.view addSubview:addButton];
}

@end
