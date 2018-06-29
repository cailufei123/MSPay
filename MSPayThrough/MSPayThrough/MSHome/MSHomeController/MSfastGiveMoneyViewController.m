//
//  MSfastGiveMoneyViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSfastGiveMoneyViewController.h"
#define timeCount 60
@interface MSfastGiveMoneyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fuImageView;
@property (weak, nonatomic) IBOutlet UILabel *fuLb;
@property (weak, nonatomic) IBOutlet UIImageView *zhouImgView;
@property (weak, nonatomic) IBOutlet UILabel *shouLb;
@property (weak, nonatomic) IBOutlet UITextField *tixiangLb;
@property (weak, nonatomic) IBOutlet UILabel *zhifuFangshiLb;
@property (weak, nonatomic) IBOutlet UITextField *codeTf;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBt;

@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)NSInteger count;
@end

@implementation MSfastGiveMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.codeTf.borderStyle =  self.tixiangLb.borderStyle = UITextBorderStyleNone;
    self.codeTf.placeholder = @"请输入验证码";
    self.tixiangLb.text = @"2000";
    self.navigationItem.title = @"快捷收款";
    NSMutableDictionary * xinyongDict = diction;
      [self.getCodeBt addTarget:self action:@selector(getCodeBtCilck) forControlEvents:UIControlEventTouchUpInside];
    [YWRequestData publicDict:xinyongDict success:^(id responseObj) {
        
    }];
    NSMutableDictionary * chuxuDict = diction;
    [YWRequestData publicDict:chuxuDict success:^(id responseObj) {
        
    }];
    WeakSelf(weakSelf)
    self.timer = [NSTimer wh_scheduledTimerWithTimeInterval:1 repeats:YES callback:^(NSTimer *timer) {
        [weakSelf timerFireMethod];
    }];
    [self.timer pauseTimer];
}
-(void)getCodeBtCilck{
    self.count = timeCount;
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
//    dic[@"mobile"] = self.phoneTf.text;
//    [YWRequestData registUserSendcodeDict:dic success:^(id responseObject) {
//        [self.timer resumeTimer];
//    }];
     [self.timer resumeTimer];
}
-(void)dealloc{
    [self.timer invalidate];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)timerFireMethod{
    if (self.count<=0){
        self.getCodeBt.userInteractionEnabled = YES;
        self.getCodeBt.selected = NO;
        [self.getCodeBt setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.timer pauseTimer];
    }else{
        self.getCodeBt.selected = YES;
        self.getCodeBt.userInteractionEnabled = NO;
        [self.getCodeBt setTitle:[NSString stringWithFormat:@"(%02ld秒)可重发", self.count-- ] forState:UIControlStateNormal];
    }
    
    
}
@end
