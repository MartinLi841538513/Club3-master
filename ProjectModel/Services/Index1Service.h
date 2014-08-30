//
//  Index1Service.h
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Index1Service : NSObject

-(NSInteger)serialidBytakeLottery;

-(UIImageView *)previewByCurrentView:(UIImageView *)curView andArray:(NSArray *)views;
-(UIImageView *)nextViewByCurrentView:(UIImageView *)curView andArray:(NSArray *)views;

-(float)accelerateSpeedOfTimeMomentWithResultValue:(NSUInteger)resultValue andEndTimerTotal:(float)endTimerTotal inViews:(NSArray *)views whenCurrentView:(UIImageView *)currentView;
-(void)moveCurrentView:(UIImageView *)curView inArray:(NSArray *)views;

-(void)showAwardViewWithDatas:(NSArray *)datas andCurrentView:(UIImageView *)currentView inController:(UIViewController *)viewController;

-(void)loadWebViewWithURLString:(NSString *)URLString onViewContrller:(UIViewController *)viewController;

-(void)presentRewardRecordViewControllerInViewController:(UIViewController *)viewController withUserId:(NSString *)userId;
@end
