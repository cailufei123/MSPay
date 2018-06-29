//
//  MSSetController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSSetController.h"
#import "MSAboutController.h"
#import "MSCardController.h"
#import "MSModifyController.h"

@interface MSSetController ()
@property (weak, nonatomic) IBOutlet UIButton *commteBtn;

@end

@implementation MSSetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    [self.commteBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}

//点击修改密码
- (IBAction)clickReviseBtn {
//    MSCardController *cardVc = [[MSCardController alloc] init];
//    [self.navigationController pushViewController:cardVc animated:YES];
    
    MSModifyController *modifyVc = [[MSModifyController alloc] init];
    [self.navigationController pushViewController:modifyVc animated:YES];
}
//点击关于我们
- (IBAction)clickAboutBtn {
    MSAboutController *aboutVc = [[MSAboutController alloc] init];
    [self.navigationController pushViewController:aboutVc animated:YES];
}
//点击检查更新按钮
- (IBAction)clickCheckBtn {
    NSMutableDictionary * dict = diction;
    dict[@"mv_version_type"] = @"2";
    dict[@"abi_code"] = @"999999";
    dict[@"command"] = @"99006";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"版本检测-%@",responseObj);
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
//            [MBManager showBriefAlert:@"密码修改成功"];
           
        }else{
            
            
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
    
}
//点击安全退出按钮
- (IBAction)clickLogOutBtn {
    
    NSString* filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"];
    
    //            NSString* filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"accountMe.data"];
    
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:filename]) {
        [defaultManager removeItemAtPath:filename error:nil];
    }
    
    [LKControllerTool chooseRootViewController];
    
}

@end
