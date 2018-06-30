//
//  MSShareController.m
//  MSPayThrough
//
//  Created by ribencun on 2018/6/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSShareController.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>
#import "RBCShareView.h"
#import "SGQRCode.h"
#import "MSShareNotice.h"
#import "Util.h"
#import "WRNavigationBar.h"

@interface MSShareController ()<RBCShareViewDelegate>
//二维码图片
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;
//分享面板
@property (nonatomic,strong)RBCShareView *shareView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,copy) NSString *endString;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backBtnY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *zhegaBtnY;

@property (nonatomic,strong) MSShareNotice *shareNotice;
@end

@implementation MSShareController

- (RBCShareView *)shareView{
    if (!_shareView) {
        _shareView = [RBCShareView sharView];
        _shareView.frame = CGRectMake(0, 0, LFscreenW, LFscreenH);
        //        _shareView.delegate = self;
        [self.view addSubview:_shareView];
    }
    return _shareView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//
    [self wr_setNavBarBackgroundAlpha:1];
    // 一行代码搞定导航栏底部分割线是否隐藏
    [self wr_setNavBarShadowImageHidden:NO];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (ABOVE_IOS11) {
        self.backBtnY.constant = 15;
        self.zhegaBtnY.constant = 5;
        
    }else{
        self.backBtnY.constant = 79;
        self.zhegaBtnY.constant = 69;
    }
    
   //分享
    [self loadShareData];
    
}

- (void)loadShareData{
    NSMutableDictionary * dict = diction;
    dict[@"abi_code"] = @"n999999";
    dict[@"command"] = @"1015";
    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        LFLog(@"分享-%@",responseObj);
        
        if ([responseObj[@"head"][@"status_code"] isEqualToString:@"000"]) {
            if ([responseObj[@"body"][@"sms_list"] count]) {
                self.shareNotice = [MSShareNotice mj_objectWithKeyValues:responseObj[@"body"][@"sms_list"][0]];
                [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:self.shareNotice.sms_image_url] placeholderImage:[UIImage imageNamed:@"share_bg"]];
                
                // 1、借助UIImageView显示二维码
                CGFloat scale = 0.2;
                 // 生成二维码(中间带有图标)
                self.qrCodeImageView.image = [SGQRCodeGenerateManager generateWithLogoQRCodeData:self.shareNotice.sm_register_url logoImageName:@"ic_launcher" logoScaleToSuperView:scale];
                
            }
            self.image =  [Util captureImageFromView:self.view];
        }else{
            
        }
    } failure:^(NSError *error) {
    
        [MBManager hideAlert];
    }];
}

//点击返回按钮
- (IBAction)clickBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}
//点击分享按钮
- (IBAction)clickShareBtn {
     self.shareView.delegate = self;
}
#pragma mark - RBCShareViewDelegate
//点击取消按钮
- (void)shareViewClickCancleBtn:(RBCShareView *)shareView{
    [shareView removeFromSuperview];
    self.shareView = nil;
}
//点击分享按钮
- (void)shareViewClickShareBtn:(RBCShareView *)shareView{
    switch (shareView.shareViewType) {
        case ShareViewType_WXFriend:
//            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
            [self shareImageToPlatformType:UMSocialPlatformType_WechatSession];
            break;
        case ShareViewType_WXFriendCircle:
//            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
            [self shareImageToPlatformType:UMSocialPlatformType_WechatTimeLine];
            break;
            
        default:
            break;
    }
}


#pragma mark - 友盟分享
- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = self.image;
    [shareObject setShareImage:self.image];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}


- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
//    NSString *thumbURL = [NSString stringWithFormat:@"%@%@",BaseUrl,self.article.CoverPicture];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    NSString *key = [manager cacheKeyForURL:[NSURL URLWithString:thumbURL]];
    SDImageCache *cache = [SDImageCache sharedImageCache];
    
    UIImage *thumbImage;
//    if (self.article.CoverPicture.length) {
//        thumbImage = [cache imageFromDiskCacheForKey:key];
//    }else{
//        thumbImage = [UIImage imageNamed:@"def_home_wenzhang"];
//    }
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:nil descr:nil thumImage:@""];
    //设置网页地址
//    shareObject.webpageUrl = self.protocolURL;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
           
//            [MBProgressHUD showAutoMessage:@"应用未安装"];
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                LFLog(@"友盟分享结果消息-%@",resp.message);
                //第三方原始返回的数据
                LFLog(@"友盟第三方原始返回的数据-%@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}

@end
