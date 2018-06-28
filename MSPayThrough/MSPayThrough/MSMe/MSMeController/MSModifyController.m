//
//  MSModifyController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSModifyController.h"

@interface MSModifyController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *finshBtn;

@end

@implementation MSModifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"修改密码";
     [self.finshBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
}
//点击完成按钮
- (IBAction)clickFinshBtn {
    
}

@end
