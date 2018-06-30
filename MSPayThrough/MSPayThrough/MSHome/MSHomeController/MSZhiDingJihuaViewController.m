//
//  MSZhiDingJihuaViewController.m
//  MSPayThrough
//
//  Created by 蔡路飞 on 2018/6/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "MSZhiDingJihuaViewController.h"

@interface MSZhiDingJihuaViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *cardnameLb;
@property (weak, nonatomic) IBOutlet UILabel *zhngdanLb;
@property (weak, nonatomic) IBOutlet UILabel *haunkuanLB;
@property (weak, nonatomic) IBOutlet UITextField *enterTf;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UILabel *countLB;
@property (strong, nonatomic)  NSMutableArray *dates;
@property (strong, nonatomic)  NSMutableArray *dates2;
@property (strong, nonatomic)  NSString *repay_dates;
@property (strong, nonatomic)  NSString *srepay_dates_text;
@property (weak, nonatomic) IBOutlet UIButton *sehgnchengiBt;
@property (assign, nonatomic)  NSInteger choseCount;
@end

@implementation MSZhiDingJihuaViewController

- (void)viewWillAppear:(BOOL)animated {
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:naverTextColor}];

}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],
       
       NSForegroundColorAttributeName:blackTextColor}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.bgView gradientFreme: CGRectMake(0, 0, LFscreenW, 150) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    
     [self.sehgnchengiBt gradientFreme: CGRectMake(0, 0, LFscreenW-40, 40) startColor:[SVGloble colorWithHexString:@"#ef6468"] endColor:[SVGloble colorWithHexString:@"#713d92"]];
    self.navigationItem.title = @"制定还款计划";
         self.automaticallyAdjustsScrollViewInsets = NO;
    [self.logo sd_setImageWithURL:[NSURL URLWithString:self.bankMcp.mcp_bank_ico]];
    self.cardnameLb.text =[NSString stringWithFormat:@"%@|尾号%@",self.bankMcp.mcp_bank_name,[self.bankMcp.mcp_card_no substringWithRange:NSMakeRange(self.bankMcp.mcp_card_no.length-4,4)]];
    self.dateLb.text = self.bankMcp.mcp_bill_date;
    self.countLB.text = self.bankMcp.mcp_repayment_date;
    self.enterTf.delegate = self;
    self.enterTf.borderStyle = UITextBorderStyleNone;
    [ self.enterTf addTarget:self
                  action:@selector(textFieldDidChangeValue:)
        forControlEvents:UIControlEventEditingChanged];
   
    NSMutableDictionary * dict = diction;
    dict[@"command"] = @"3001";
    dict[@"bank_acc_name"] = self.bankMcp.mcp_user_name;
    dict[@"bank_acc_no"] = self.bankMcp.mcp_card_no;
    [YWRequestData publicDict:dict success:^(id responseObj) {
       
      
        NSString *string =responseObj[@"body"][@"qrp_plan_cycle"];
        
        
        
       self.dates =  [self nowTimedayTime:string setDateFormat:@"dd"];
        self.dates2 =  [self nowTimedayTime:string setDateFormat:@"yyyy-MM-dd"];
//
    }];
    
    
   
  
}
-(NSMutableArray *)nowTimedayTime:(NSString * )string setDateFormat:(NSString * )formatStr{
     NSMutableArray *dates = [NSMutableArray array];
    LFLog(@"%@",string);
    NSArray *array = [string componentsSeparatedByString:@"~"]; //从字符A中分隔成2个元素的数组
    NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
    NSString * start = [array firstObject];
    NSString * end = [array lastObject];
    long long nowTime = [[self dateConversionTimeStamp:[self nsstringConversionNSDate:start]] longLongValue], //开始时间
    endTime = [[self dateConversionTimeStamp:[self nsstringConversionNSDate:end]] longLongValue],
    
    
    
    dayTime = 24*60*60,
    
    time = nowTime - nowTime%dayTime + dayTime;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatStr];
    
    while (time < endTime+dayTime) {
        NSString *showOldDate = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
        [dates addObject:showOldDate];
        time += dayTime;
    }
    return dates;

}
// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimeStr:(NSString *)str{
    NSTimeInterval time=[str doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss SS"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}


-(NSDate *)nsstringConversionNSDate:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datestr = [dateFormatter dateFromString:dateStr];
    return datestr;
}
-(NSString *)dateConversionTimeStamp:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}



- (void)textFieldDidChangeValue:(id)sender
{
 NSString * texts = ((UITextField *)sender).text;
     LFLog(@"%@",texts);
    
    
//    repay_dates = "";
//    srepay_dates_text = "";
//    choseCount = 1;
  
    if (texts.length > 2 &&  [texts integerValue]>= 560) {
      self. choseCount = [texts integerValue]/ 560;
        NSInteger dateCount = (self.choseCount % 2 == 0 ? self.choseCount / 2 :self. choseCount / 2 + 1);
       dateCount =  [self.dates count] > dateCount ? dateCount :  [self.dates count];
          NSArray * smallArray = [self.dates subarrayWithRange:NSMakeRange(2, dateCount)];
        NSArray * smallArray1 = [self.dates2 subarrayWithRange:NSMakeRange(2, dateCount)];
        LFLog(@"%@",smallArray);
        LFLog(@"%@",smallArray1);
          self.repay_dates = [smallArray componentsJoinedByString:@","];
         self.srepay_dates_text = [smallArray1 componentsJoinedByString:@"|"];
        self.choseCount = self.choseCount > dateCount * 2 ? dateCount * 2 : self.choseCount;
    }
    
    if (self.repay_dates.length||texts.length<=2) {
        self.dateLb.text = self.repay_dates;
        self.dateLb.hidden = NO;
    }else{
         self.dateLb.hidden = YES;
        
    }
    if (self.choseCount) {
        self.countLB.text = [NSString stringWithFormat:@"%ld",(long)self.choseCount];
        self.countLB.hidden = NO;
    }else{
        self.countLB.hidden = YES;
        
    }
   
}
- (IBAction)kdfkdfk:(id)sender {
    
    NSMutableDictionary * dict = diction;
   
     dict[@"command"] = @"3002";
     dict[@"bank_acc_name"] = self.bankMcp.mcp_user_name;
     dict[@"bank_acc_no"] = self.bankMcp.mcp_card_no;
     dict[@"repay_money_total"] = [NSString stringWithFormat:@"%@00",self.enterTf.text] ;
     dict[@"qrp_plan_cycle"] = [NSString stringWithFormat:@"%@|",self.srepay_dates_text];
     dict[@"qrp_repay_count"] =  [NSString stringWithFormat:@"%ld",(long)self.choseCount];
   
    LFLog(@"%@",dict);
    [YWRequestData publicDict:dict success:^(id responseObj) {
        
    }];
    
}

@end
