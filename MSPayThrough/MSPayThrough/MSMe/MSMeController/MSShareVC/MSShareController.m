//
//  MSShareController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSShareController.h"

@interface MSShareController ()
//二维码图片
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;

@end

@implementation MSShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//点击返回按钮
- (IBAction)clickBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}
//点击分享按钮
- (IBAction)clickShareBtn {
    
}


@end
