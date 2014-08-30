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

@implementation LoginService

-(void)loginWithName:(NSString *)name andPasswd:(NSString *)passwd onViewController:(LoginViewController *)viewController{
    if ([self validateLoginInfosWithName:name andPasswd:passwd]) {
        [viewController.delegate loginSuccessedActionWithViewController:viewController];  //dismiss viewcontroller
        
        UserDefaults *userdefaults = [[UserDefaults alloc] init]; //set login status
        [userdefaults setIsLogin:@"YES"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccessAction" object:self];  //loadData
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
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        return true;
    }
}

@end
