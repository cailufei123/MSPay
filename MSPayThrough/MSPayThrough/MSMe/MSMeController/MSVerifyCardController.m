//
//  MSVerifyCardController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSVerifyCardController.h"
#import <AipOcrSdk/AipOcrSdk.h>

@interface MSVerifyCardController ()
/**
持卡人
 */
@property (weak, nonatomic) IBOutlet UITextField *cardTF;
/**
 身份证
 */
@property (weak, nonatomic) IBOutlet UITextField *cardNumTF;
/**
签发机关
 */
@property (weak, nonatomic) IBOutlet UITextField *bodyTF;
/**
 有效期
 */
@property (weak, nonatomic) IBOutlet UITextField *timeTF;
//提交按钮
@property (weak, nonatomic) IBOutlet UIButton *commteBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewY;

@end

@implementation MSVerifyCardController{
    // 默认的识别成功的回调
    void (^_successHandler)(id);
    // 默认的识别失败的回调
    void (^_failHandler)(NSError *);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (ABOVE_IOS11) {
        self.topViewY.constant = 0;
    }else{
        self.topViewY.constant = 64;
    }
    
    self.navigationItem.title = @"身份验证";
    [self.commteBtn gradientFreme: CGRectMake(0, 0, LFscreenW - 90, 45) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
    [[AipOcrService shardService] authWithAK:@"MBIvCmrvK2xNrk19M9LdV6wo" andSK:@"9XPe1bIA8EN7pO7Awhoxg1dVOckc0zIi"];
}
//点击身份证正面相机
- (IBAction)clickCardBtn {
//    UIViewController * vc =
//    [AipCaptureCardVC ViewControllerWithCardType:CardTypeIdCardFont
//                                 andImageHandler:^(UIImage *image) {
//
//                                     [[AipOcrService shardService] detectIdCardFrontFromImage:image
//                                                                                  withOptions:nil
//                                                                               successHandler:_successHandler
//                                                                                  failHandler:_failHandler];
//                                 }];
//
//    [self presentViewController:vc animated:YES completion:nil];
    UIViewController * vc =
    [AipCaptureCardVC ViewControllerWithCardType:CardTypeLocalIdCardFont andImageHandler:^(UIImage *image) {
        // 成功扫描出身份证
        [[AipOcrService shardService] detectIdCardFrontFromImage:image
                                                     withOptions:nil
                                                  successHandler:^(id result){
                                                      // 在成功回调中，保存图片到系统相册
                                                      UIImageWriteToSavedPhotosAlbum(image, nil, nil, (__bridge void *)self);
                                                      // 打印出识别结果
                                                      NSLog(@"%@", result);
                                                  }
                                                     failHandler:_failHandler];
    }];
    // 展示ViewController
    [self presentViewController:vc animated:YES completion:nil];
}
//点击身份证反面相机
- (IBAction)clickBodyBtn {
    UIViewController * vc =
    [AipCaptureCardVC ViewControllerWithCardType:CardTypeIdCardBack
                                 andImageHandler:^(UIImage *image) {
                                     
                                     [[AipOcrService shardService] detectIdCardBackFromImage:image
                                                                                 withOptions:nil
                                                                              successHandler:_successHandler
                                                                                 failHandler:_failHandler];
                                 }];
    [self presentViewController:vc animated:YES completion:nil];
}
//点击提交按钮
- (IBAction)clickCommteBtn {
    
    if (self.cardTF.text.length == 0) {
        [MBManager showBriefAlert:@"请输入姓名"];
        return;
    }
    if (self.cardNumTF.text.length == 0) {
        [MBManager showBriefAlert:@"请输入身份证号"];
        return;
    }
    
    if (![NSString accurateVerifyIDCardNumber:self.cardNumTF.text]) {
        [MBManager showBriefAlert:@"请输入正确的身份证号"];
        return;
    }
    
    if (self.bodyTF.text.length == 0) {
        [MBManager showBriefAlert:@"请输入签发机关"];
        return;
    }
    if (self.timeTF.text.length == 0) {
        [MBManager showBriefAlert:@"请输入身份证有效期"];
        return;
    }
    
    NSMutableDictionary * dict = diction;
    
    dict[@"mci_name"] = self.cardTF.text;
    dict[@"mci_id_card"] = self.cardNumTF.text;
    dict[@"mci_sign_org_name"] = self.bodyTF.text;
    dict[@"mci_period_of_validity"] = self.timeTF.text;
    dict[@"command"] = @"1010";

    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
//        LFLog(@"responseObj-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            [MBManager showscuess:@"绑定成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [MBManager showBriefAlert:@"绑定失败"];
            
        }
        
    } failure:^(NSError *error) {
        //        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

@end
