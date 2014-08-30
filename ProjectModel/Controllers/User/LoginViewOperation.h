//
//  LoginViewOperation.h
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"

@interface LoginViewOperation : NSObject

/*
 1，在当前viewcontroller调出loginviewController
 2，给当前viewcontroller添加监听事件
 */
-(void)presentLoginViewControllerInViewController:(UIViewController *)viewController;
@end
