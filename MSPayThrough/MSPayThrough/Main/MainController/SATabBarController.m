//
//  SATabBarController.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/7.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SATabBarController.h"
#import "SANavigationController.h"
#import "SATabBar.h"
#import "MSMesController.h"
#import "MSHomeViewController.h"
#import "MSBillViewController.h"
#import "MSMeModel.h"
#import "MSCardController.h"


@interface SATabBarController ()<UITabBarControllerDelegate,tabBaruDelegate>
@property (nonatomic, assign)NSInteger oldSelectIndex; 
@property (nonatomic,strong) NSMutableArray *bankLists;

@property (nonatomic,strong) MSMeModel *meModel;
@end

@implementation SATabBarController
- (NSMutableArray *)bankLists{
    if (!_bankLists) {
        _bankLists = [NSMutableArray array];
    }
    return _bankLists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**** 设置所有UITabBarItem的文字属性 ****/
    [self setupItemTitleTextAttributes];
    /**** 添加子控制器 ****/
    [self setupChildViewControllers];
    [self setupTabBar];
    
    //获取用户信息
    [self loadUserInfo];
    
    //获取银行卡列表
    [self loadBankList];
    
    
//     [self computeReddot];
    self.delegate = self;
//    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
//    ([UIScreeninstancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
}
-(void)viewWillAppear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(longinseccous) name:@"longinseccous" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(immediatelyWish) name:skipHomeNotice object:nil];
//    [LFNSNOTI addObserver:self selector:@selector(classifClick) name:skipClassif object:nil];
//////    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushmessageClick) name:@"pushmessage" object:nil];
//   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getmessageBageVlu) name:pushRefresh object:nil];
////
   }
-(void)classifClick{
  self.selectedIndex = 1;
    
}
-(void)immediatelyWish{
 self.selectedIndex = 0;

}
-(void)pushmessageClick{
//    self.selectedIndex = 0;
//    SAMessageViewController *messageVc = [[SAMessageViewController alloc] init];
//    [self .navigationController pushViewController:messageVc animated:YES];
//    
}

-(void)viewWillDisappear:(BOOL)animated{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
-(void)getmessageBageVlu{
//    [self computeReddot];
}

//-(void)computeReddot{
//    NSMutableArray * datas1 = [[DataBase sharedDataBase] lookUpWith:@"0"];
//
//    if (datas1.count>0) {
//         self. ntrol.navigationController.tabBarItem.badgeValue = [NSString stringWithFormat: @"%ld",datas1.count];
//
//    }else {
//        self. ntrol.navigationController.tabBarItem.badgeValue = nil;
//
//    }
//
//
//}
-(void)setupItemTitleTextAttributes{
    UITabBarItem * item =[UITabBarItem  appearance];
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [SVGloble colorWithHexString:@"#444444"];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [SVGloble colorWithHexString:@"#B378D5"];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
-(void)setupChildViewControllers{

    [self setupOneChildViewController:[[SANavigationController alloc] initWithRootViewController:[[MSHomeViewController alloc] init]]  title:@"首页" image:@"bottombar_home_off" selectedImage:@"bottombar_home_on"];
      [self setupOneChildViewController:[[SANavigationController alloc] initWithRootViewController:[[MSBillViewController alloc] init]]  title:@"账单" image:@"bottombar_bill_off" selectedImage:@"bottombar_bill_on"];
    
       [self setupOneChildViewController:[[SANavigationController alloc] initWithRootViewController:[[MSMesController alloc] init]]  title:@"我的" image:@"bottombar_mine_off" selectedImage:@"bottombar_mine_on"];
}
-(void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString*)image selectedImage:(NSString *)selectedImage{
    
    vc.tabBarItem.title = title;
    if (image.length) { // 图片名有具体值
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
    
    
}
-(void)setupTabBar{
    SATabBar * tabBar =  [[SATabBar alloc] init];
    tabBar.tabBarDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
}
-(void)selectedItemButton:(NSInteger)index{
//    if (!loginTokenlength) {
//        [ATSKIPTOOl loginAction:self];return;
//    }
////   self.selectedIndex = index;
//    YMCreateRoomController * registLoinViewController = [[YMCreateRoomController alloc] init];
//    SALoginRegistNavController * loginRegistNavController = [[SALoginRegistNavController alloc] initWithRootViewController:registLoinViewController];
//
//    [self presentViewController:loginRegistNavController animated:YES completion:nil];
    
}


-(BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    self.oldSelectIndex = tabBarController.selectedIndex;
    // 记录之前选择的selectedIndex
    return YES;
}

-(void)tabBarController:(UITabBarController*)tabBarController didSelectViewController:(UIViewController*)viewController
{
    if ([YCArchiveTool meModel].mci.mci_id_card.length > 0 && self.bankLists.count > 0) {
    }else{
        MSCardController *cardVc = [[MSCardController alloc] init];
        SANavigationController *nav = [[SANavigationController alloc] initWithRootViewController:cardVc];
        cardVc.fromClassVc = [SANavigationController class];
        [self presentViewController:nav animated:yellowBoderColor completion:nil];
    }
    
    if (tabBarController.selectedIndex == 0) {
      
    }else if (tabBarController.selectedIndex == 1){
//        if (!loginTokenlength) {
//            tabBarController.selectedIndex = self.oldSelectIndex;
//            [ATSKIPTOOl loginAction:self];return;
//        }
    }else{
        
    }
}
- (void)loadBankList{
    NSMutableDictionary * dict = diction;
    dict[@"mcp_card_type"] = @"99";
    dict[@"command"] = @"1006";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        //        LFLog(@"银行卡列表-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [self.bankLists removeAllObjects];
            NSArray *bankLists = responseObj[@"body"][@"mcp"];
            [self.bankLists addObjectsFromArray:bankLists];
        }
        
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}

- (void)loadUserInfo{
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"1003";
    
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
        
    } success:^(id responseObj) {
        
        LFLog(@"个人信息-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            
            self.meModel = [MSMeModel mj_objectWithKeyValues:responseObj[@"body"]];
            [YCArchiveTool saveMeModel:self.meModel];
            
            
        }else{
            //            [MBManager showBriefAlert:@"绑定失败"];
            
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

-(void)longinseccous{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         self.selectedIndex = 3;
    });
   
}

@end
