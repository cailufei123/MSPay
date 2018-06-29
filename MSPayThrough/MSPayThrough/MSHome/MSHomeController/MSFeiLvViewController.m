//
//  MSFeiLvViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSFeiLvViewController.h"
#import "MSFeiLvTopVoew.h"
#import "MSFeiLvTableViewCell.h"
@interface MSFeiLvViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UISearchBarDelegate>
@property(nonatomic,strong)MSFeiLvTopVoew * feiLvTopVoew;

@property(nonatomic,strong)NSMutableArray * datas;
@property(nonatomic,strong)UITableView * tableView;

@end
static NSString * const  cellidenfder = @"MSFeiLvTableViewCell";
@implementation MSFeiLvViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"费率";
    self.feiLvTopVoew = [MSFeiLvTopVoew loadNameFeiLvTopVoewXib];
     [self setTable];
    NSMutableDictionary * publicDict = diction;
    publicDict[@"command"] = @"1005";
    [YWRequestData  publicDict:publicDict success:^(id responseObj) {
        
        self.datas = [FeiLVModel mj_objectArrayWithKeyValuesArray:responseObj[@"body"][@"fee_list"]];
        
        [self.tableView reloadData];
    }];
    
}

-(void)setTable{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight,LFscreenW ,LFscreenH-kTopHeight) style:UITableViewStylePlain];
    
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
    self.feiLvTopVoew = [MSFeiLvTopVoew loadNameFeiLvTopVoewXib];
    self.feiLvTopVoew.frame = CGRectMake(0, 0, LFscreenW, 50);
    self.tableView.tableHeaderView =    self.feiLvTopVoew;
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
    
    return 60;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeiLVModel * xiangQinModel =   self.datas [indexPath.row];
    MSFeiLvTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
   cell.xiangQinModel = xiangQinModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
