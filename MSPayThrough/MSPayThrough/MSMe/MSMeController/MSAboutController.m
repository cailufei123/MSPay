//
//  MSAboutController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSAboutController.h"

@interface MSAboutController ()
//公司名称
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
//电话
@property (weak, nonatomic) IBOutlet UILabel *phoneLabe;

@end

@implementation MSAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title = @"谊付通";
}

@end
