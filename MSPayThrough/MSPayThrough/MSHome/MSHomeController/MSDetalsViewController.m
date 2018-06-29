//
//  MSDetalsViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSDetalsViewController.h"
#import "MSDetailsTopView.h"
#import "MSDetailsTableViewCell.h"
@interface MSDetalsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UISearchBarDelegate>
@property(nonatomic,strong)NSMutableArray * datas;
@property(nonatomic,strong)MSDetailsTopView * detailsTopView;
@property(nonatomic,strong)UITableView * tableView;

@end
static NSString * const  cellidenfder = @"MSDetailsTableViewCell";
@implementation MSDetalsViewController
- (void)viewWillAppear:(BOOL)animated {
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:blackTextColor}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"计划详情";
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:naverTextColor}];
    self.automaticallyAdjustsScrollViewInsets = NO;
      NSMutableDictionary * xiangQinDict =diction;
    xiangQinDict[@"command"] = @"3005";
     xiangQinDict[@"qrp_id"] = self.homeModel.qrp_id;
    [YWRequestData xiangQinDict:xiangQinDict success:^(id responseObj) {
        self.datas = [XiangQinModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"qrpd_list"]];
        [self.tableView reloadData];
    }];
    self.detailsTopView = [MSDetailsTopView loadNameDetailsTopViewXib];
    self.detailsTopView .clf_width = LFscreenW;
    [self.view addSubview: self.detailsTopView];
   
    self.detailsTopView.homeModel = self.homeModel;
    [self setTable];
  
}

-(void)setTable{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0,  self.detailsTopView.clf_bottom, LFscreenW, LFscreenH-(self.detailsTopView.clf_bottom)) style:UITableViewStylePlain];
    [self.view  addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor  =bagColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:cellidenfder bundle:nil] forCellReuseIdentifier:cellidenfder];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    if (@available(iOS 11.0, *)) {
        
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
  
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return  0 ;
    }else{
        return 0.01f;
    }
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return    self.datas .count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XiangQinModel * xiangQinModel =   self.datas [indexPath.row];
    MSDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    cell.xiangQinModel = xiangQinModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}



@end
