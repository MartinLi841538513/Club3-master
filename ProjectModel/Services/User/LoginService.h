//
//  LoginService.h
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "UserModel.h"
@interface LoginService : NSObject

/*
     功能：
     一，验证登录
     二，成功后做两个处理：
     1，dismiss loginviewController
     2, 在响应notice，设置login status为登录状态，并且在viewController中reloadData
 */
-(void)loginWithName:(NSString *)name andPasswd:(NSString *)passwd onViewController:(LoginViewController *)viewController;

//跳转到注册界面
-(void)pushRegisterViewControllerOnViewController:(LoginViewController *)viewController;

-(void)handlesWhenDismissLoginViewController:(LoginViewController *)loginViewContrller withUserInfos:(UserModel *)model;

@end
