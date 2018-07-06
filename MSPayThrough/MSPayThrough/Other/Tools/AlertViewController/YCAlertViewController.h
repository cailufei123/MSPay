//
//  YCAlertViewController.h
//  自定义警告框
//
//  Created by 李勇聪 on 16/8/24.
//  Copyright © 2016年 李勇聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCAlertAction : NSObject

@property (nonatomic, copy) NSString *title;

+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)(YCAlertAction *action))handler;

@end


@interface YCAlertViewController : UIViewController

@property (nonatomic, readonly) NSArray<YCAlertAction *> *actions;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSTextAlignment messageAlignment;

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message;
- (void)addAction:(YCAlertAction *)action;

@end
