//
//  LoginService.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "LoginService.h"
#import "SVProgressHUD.h"
#import "RegisterViewController.h"
#import "UserDefaults.h"
#import "MyMD5.h"
#import "InternetRequest.h"
#import "UserDao.h"
#import "ChooseAreaViewController.h"

@implementation LoginService

-(void)loginWithName:(NSString *)name andPasswd:(NSString *)passwd onViewController:(LoginViewController *)viewController{
    if ([self validateLoginInfosWithName:name andPasswd:passwd]) {
        
        [SVProgressHUD show];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //InteractWithServerOnJSON interactWithServerOnJSON 这是我自己封装的加载json数据的方法
            UserDao *userDao = [[UserDao alloc] init];
            UserModel *model = [userDao getUserWithName:name andPassword:passwd];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (model==nil) {
                    [SVProgressHUD showErrorWithStatus:@"登录失败"];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                    if (model.sid==nil||[model.sid isEqualToString:@""]) {
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
                        ChooseAreaViewController *chooseAreaViewController = [storyboard instantiateViewControllerWithIdentifier:@"ChooseAreaViewController"];
                        chooseAreaViewController.userModel = model;
                        chooseAreaViewController.loginViewController = viewController;
                        [viewController.navigationController pushViewController:chooseAreaViewController animated:YES];
                    }else{
                        [self handlesWhenDismissLoginViewController:viewController withUserInfos:(UserModel *)model];
                    }
                }
            });
        });
    }
}

-(void)pushRegisterViewControllerOnViewController:(LoginViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    registerViewController.delegate = viewController;
    [viewController.navigationController pushViewController:registerViewController animated:YES];
}

//验证登录
-(BOOL)validateLoginInfosWithName:(NSString *)name andPasswd:(NSString *)passwd{
    
    if ([name isEqualToString:@""]||name==nil) {
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空"];
        return false;
    }else if([passwd isEqualToString:@""]||passwd==nil){
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        return false;
    }else{
        return true;
    }
}

//dismiss LoginViewController时处理操作
-(void)handlesWhenDismissLoginViewController:(LoginViewController *)loginViewContrller withUserInfos:(UserModel *)model{
    [loginViewContrller.delegate loginSuccessedActionWithViewController:loginViewContrller];  //dismiss viewcontroller
    
    UserDefaults *userdefaults = [[UserDefaults alloc] init]; //set login status
    [userdefaults setIsLogin:@"YES"];
    [userdefaults setUserModel:model];    //set UserInfos 
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccessAction" object:self];  //loadData
}

@end
