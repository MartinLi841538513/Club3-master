//
//  Index0Service.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index0Service.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "SVProgressHUD.h"
#import "UserDao.h"
#import "LoginViewController.h"
@implementation Index0Service

-(void)loadUserDefaultsInViewController:(Index0ViewController *)viewController{

    if ([viewController.tabBarController.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)viewController.tabBarController.presentedViewController;
        if ([nav.viewControllers.firstObject isKindOfClass:[LoginViewController class]]) {
            NSLog(@"用户登录进来，不需要重复加载数据了");
        }
    }else{
        //用户进来需要实时刷新数据。
        UserDefaults *userDefaults = [[UserDefaults alloc] init];
        UserModel *userModel = [userDefaults userModel];
        NSString *name = userModel.loginname;
        
        [SVProgressHUD show];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //InteractWithServerOnJSON interactWithServerOnJSON 这是我自己封装的加载json数据的方法
            UserDao *userDao = [[UserDao alloc] init];
            UserModel *model = [userDao getUserWithName:name];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (model==nil) {
                    [SVProgressHUD showErrorWithStatus:@"数据加载失败，请退出账号重新登录"];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"数据加载成功"];
                    [userDefaults setUserModel:model];    //set UserInfos
                }
            });
        });

    }
    
}

@end
