//
//  Index1ViewController.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index1ViewController.h"
#import "InternetRequest.h"
#import "Index1Service.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "SVProgressHUD.h"
#define HongbaoImg [UIImage imageNamed:@"hongbao.jpg"]
#define CurImg nil

@interface Index1ViewController ()
{
    __weak IBOutlet UIImageView *view1;
    __weak IBOutlet UIImageView *view2;
    __weak IBOutlet UIImageView *view3;
    __weak IBOutlet UIImageView *view4;
    __weak IBOutlet UIImageView *view5;
    __weak IBOutlet UIImageView *view6;
    __weak IBOutlet UIImageView *view7;
    __weak IBOutlet UIImageView *view8;
    __weak IBOutlet UIImageView *view9;
    __weak IBOutlet UIImageView *view10;
    __weak IBOutlet UIImageView *view11;
    __weak IBOutlet UIImageView *view12;
    __weak IBOutlet UIButton *startButton;
    __weak IBOutlet UILabel *tipLabel;
    
    NSArray *array;
    NSArray *datas;
    NSTimer *timer;
    UIImageView *currentView;
    float intervalTime;//变换时间差（用来表示速度）
    float accelerate;//减速度
    float endTimerTotal;//减速共耗时间

    Index1Service *index1Service;
    UserDefaults *userDefaults;
    UserModel *userModel;
}
@end

@implementation Index1ViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        index1Service = [[Index1Service alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    endTimerTotal = 5.0;
    
    array = [[NSArray alloc] initWithObjects:view1,view2,view3,view4,view5,view6,view7,view8,view9,view10,view11,view12,nil];
    NSUInteger count = array.count;
    for (int i=0; i<count; i++) {
        UIImageView *view = array[i];
        view.tag = i;
    }
    
    userDefaults = [[UserDefaults alloc] init];
    userModel = [userDefaults userModel];
    tipLabel.text = [NSString stringWithFormat:@"您当前还有%ld次机会，已有%ld人参与抽奖",userModel.nums,userModel.peoples];
    datas = [[NSArray alloc] initWithObjects:@"0.88",@"0.20",@"5.00",@"0.80",@"1.80",@"谢谢参与",@"188.00",@"2.80",@"0.18",@"0.08",@"18.00",@"1.20",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//抽奖
- (IBAction)drawLotteryAction:(id)sender {
    NSInteger num = userModel.nums;
    if (num==0) {
        [SVProgressHUD showErrorWithStatus:@"您今日抽奖次数已用完"];
    }else{
        [self initViews];
        timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(startChoujiang:) userInfo:currentView repeats:NO];
        num--;
        userModel.nums = num;
        [userDefaults setUserModel:userModel];
        tipLabel.text = [NSString stringWithFormat:@"您当前还有%ld次机会，已有%ld人参与抽奖",userModel.nums,userModel.peoples];
    }

}
- (IBAction)checkRules:(id)sender {
    NSString *urlString = @"http://earea.stcyclub.com/wap.php/Member/agree";
    [index1Service loadWebViewWithURLString:urlString onViewContrller:self];
}
- (IBAction)rewardRecord:(id)sender {
    [index1Service presentRewardRecordViewControllerInViewController:self withUserId:userModel.mid];
}

//初始化views的效果
-(void)initViews{
    intervalTime = 0.8;//起始的变换时间差（速度）
    currentView.image = HongbaoImg;
    currentView = [array objectAtIndex:0];
    currentView.image = CurImg;
    
    startButton.enabled = NO;
}

-(void)startChoujiang:(id)sender{
    NSUInteger count = array.count;
    NSTimer *myTimer = (NSTimer *)sender;
    UIImageView *preView = (UIImageView *)myTimer.userInfo;
    NSUInteger index;
    static NSUInteger resultValue=13;

    if (preView==nil) {
        index = 0;
    }else{
        index = [array indexOfObject:preView];
    }
    if (index==count-1) {
        currentView = [array objectAtIndex:0];
    }else{
        currentView = [array objectAtIndex:index+1];
    }
    
    [index1Service moveCurrentView:currentView inArray:array];
    
    NSLog(@"%f",intervalTime);
    if (intervalTime>0.1) {
        intervalTime = intervalTime - 0.1;
    }else{
        static int rotateCount = 0;
        rotateCount ++;
        if (rotateCount==2*count) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSLog(@"aa:%lu",(unsigned long)resultValue);
                if (resultValue==13) {
                    resultValue = 14;//这里设置13，14主要是用来防止在一次抽奖，发送了2次请求
                    resultValue= [index1Service serialidBytakeLottery];
                    if (resultValue==0) {
                        resultValue=6;
                    }
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        NSLog(@"ss:%lu",(unsigned long)resultValue);
                        [self endChoujiangWithResultValue:resultValue];
                        resultValue = 13;
                    });
                }

            });
            rotateCount = 0;
        }
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(startChoujiang:) userInfo:currentView repeats:NO];
}


-(void)endChoujiangWithResultValue:(NSUInteger)resultValue{
    accelerate = [index1Service accelerateSpeedOfTimeMomentWithResultValue:resultValue andEndTimerTotal:endTimerTotal inViews:array whenCurrentView:currentView];
    [self moveToStopWithAccelerate];
}

//减速至停止
-(void)moveToStopWithAccelerate{

    static float timeTotal = 0;
    if (timeTotal<endTimerTotal) {
        intervalTime = intervalTime+accelerate;
        timeTotal = timeTotal+intervalTime;
        currentView = [index1Service nextViewByCurrentView:currentView andArray:array];
        [index1Service moveCurrentView:currentView inArray:array];
        [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:intervalTime target:self selector:@selector(moveToStopWithAccelerate) userInfo:nil repeats:NO];
    }else{
        [timer invalidate];
        timeTotal = 0;
        [index1Service showAwardViewWithDatas:datas andCurrentView:currentView inController:self];
        startButton.enabled = YES;
    }
    
}




#pragma UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        NSLog(@"跑去领奖");
    }
}

@end
