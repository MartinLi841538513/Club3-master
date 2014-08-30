//
//  LoginViewOperation.m
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "LoginViewOperation.h"

@implementation LoginViewOperation


-(void)presentLoginViewControllerInViewController:(UIViewController<LoginViewControllerDelegate> *)viewController{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController *userNavigationController = [[UINavigationController alloc] init];
    userNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"UserNavigationController"];
    LoginViewController *loginViewController = userNavigationController.viewControllers.firstObject;
    loginViewController.delegate = viewController;
    [viewController presentViewController:userNavigationController animated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:viewController selector:@selector(loginSuccessAction:) name:@"loginSuccessAction" object:nil];
}

/*
 1，设置login status 为登录状态
 2，在当前viewcontroller loadData
 注意：loginSuccessAction方法的实现在viewcontroller里，这里的loginSuccessAction是不会被触发的
 */
-(void)loginSuccessAction:(NSNotification *)nc{
    
}

@end
