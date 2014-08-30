//
//  UserDetailService.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "UserDetailService.h"
#import "LoginViewOperation.h"
#import "UserDefaults.h"

@implementation UserDetailService

/*
 1,设置login status 为注销状态
 2,调出loginViewController界面
 */
-(void)loginoutActionInViewController:(UserDetailViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    [userDefaults setIsLogin:@"NO"];
    
    LoginViewOperation *loginViewOperation = [[LoginViewOperation alloc] init];
    [loginViewOperation presentLoginViewControllerInViewController:viewController];
}

@end
