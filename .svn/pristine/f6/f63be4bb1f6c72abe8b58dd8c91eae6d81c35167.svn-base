//
//  Index1Service.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index1Service.h"
#import "WebViewController.h"
#import "RewardRecordsViewController.h"
#define HongbaoImg [UIImage imageNamed:@"hongbao.jpg"]
#define CurImg nil

@implementation Index1Service

//得到上一个view
-(UIImageView *)previewByCurrentView:(UIImageView *)curView andArray:(NSArray *)views{
    NSUInteger count = views.count;
    NSUInteger curIndex = [views indexOfObject:curView];
    NSUInteger preIndex;
    if (curIndex==0) {
        preIndex = count-1;
    }else{
        preIndex = curIndex-1;
    }
    return [views objectAtIndex:preIndex];
}

//得到下一个view
-(UIImageView *)nextViewByCurrentView:(UIImageView *)curView andArray:(NSArray *)views{
    NSUInteger count = views.count;
    NSUInteger curIndex = [views indexOfObject:curView];
    NSUInteger nextIndex;
    if (curIndex==count-1) {
        nextIndex = 0;
    }else{
        nextIndex = curIndex+1;
    }
    return [views objectAtIndex:nextIndex];
}

//计算时间的加速度
-(float)accelerateSpeedOfTimeMomentWithResultValue:(NSUInteger)resultValue andEndTimerTotal:(float)endTimerTotal inViews:(NSArray *)views whenCurrentView:(UIImageView *)currentView{
    float a;
    NSUInteger currentIndex = [views indexOfObject:currentView];
    NSUInteger count = views.count;
    float NSUIntegerervalTime = 0.1;
    NSUInteger endLength;
    
    if (resultValue>currentIndex+1) {
        endLength = resultValue-currentIndex+count-1;
    }else{
        endLength = 2*count-currentIndex-1+resultValue;
    }
    a = (2*endTimerTotal/endLength-2*NSUIntegerervalTime)/(endLength-1);
    return a;
}

//红包移动一下
-(void)moveCurrentView:(UIImageView *)curView inArray:(NSArray *)views{
    
    UIImageView *preView = [self previewByCurrentView:curView andArray:views];
    preView.image = HongbaoImg;
    curView.image = CurImg;
}

-(void)showAwardViewWithDatas:(NSArray *)datas andCurrentView:(UIImageView *)currentView inController:(UIViewController *)viewController{
    NSUInteger index = currentView.tag;
    NSString *result = [datas objectAtIndex:index];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"中奖信息" message:result delegate:viewController cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    NSLog(@"你中了：%@元红包",result);
}

//加载网络webview（活动规则）
-(void)loadWebViewWithURLString:(NSString *)URLString onViewContrller:(UIViewController *)viewController{
    WebViewController *webViewController = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    webViewController.hidesBottomBarWhenPushed = YES;
    webViewController.urlString = URLString;
    [viewController.navigationController pushViewController:webViewController animated:YES];
}

//跳至中奖记录
-(void)presentRewardRecordViewControllerInViewController:(UIViewController *)viewController{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RewardRecordsViewController *recordViewController = [storyboard instantiateViewControllerWithIdentifier:@"RewardRecordsViewController"];
        recordViewController.hidesBottomBarWhenPushed = YES;
        [viewController.navigationController pushViewController:recordViewController animated:YES];
}
@end
