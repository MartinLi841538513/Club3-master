//
//  KillService.h
//  Club
//
//  Created by MartinLi on 14-10-22.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KillListViewController.h"
#import "KillDetailViewController.h"

@protocol KillServiceDelegate <NSObject>

-(void)startCountDownActionWithSeconds:(NSInteger)seconds;

@end

@interface KillService : NSObject
@property(nonatomic,weak)id<KillServiceDelegate> delegate;
-(void)loadKillListInViewController:(KillListViewController *)viewController;
-(void)loadCountDownInViewController:(KillDetailViewController *)viewController;
-(void)killInViewController:(KillDetailViewController *)viewController;
@end
