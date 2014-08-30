//
//  RegisterService.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RegisterService.h"
#import "SVProgressHUD.h"
#import "InternetRequest.h"
#import "MyMD5.h"
#import "UserDao.h"

@implementation RegisterService

/*
    1,验证是否电话号码
 
 */
-(void)sendCodeActionWithLoginname:(NSString *)name{
    if (name==nil||[name isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"号码有误"];
    }else{
        [SVProgressHUD show];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            UserDao *userDao = [[UserDao alloc] init];
            BOOL b = [userDao sendValidateCodeWithName:name];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (b==YES) {
                    [SVProgressHUD showSuccessWithStatus:@"发送成功"];
                }else{
                    [SVProgressHUD showErrorWithStatus:@"发送失败"];
                }
            });
        });
    }
}

-(void)registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm onViewController:(RegisterViewController *)viewController{
    if ([self validateRegisterName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm]) {
        
        [SVProgressHUD show];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            UserDao *userDao = [[UserDao alloc] init];
            BOOL b = [userDao registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (b==YES) {
                    [SVProgressHUD showSuccessWithStatus:@"注册成功"];
                    [viewController.navigationController popViewControllerAnimated:YES];
                    [viewController.delegate registerSuccessWithLoginname:name andPasswd:passwd];
                }else{
                    [SVProgressHUD showErrorWithStatus:@"注册失败"];
                }
            });
        });
    }
}


/*
 验证注册信息
 */
-(BOOL)validateRegisterName:(NSString*)name andCode:(NSString *)codeNumber andPasswd:(NSString *)passwd andPasswordConfirm:(NSString *)passwdConfirm{
    if ([name isEqualToString:@""]||name==nil) {
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空"];
        return NO;
    }else if([codeNumber isEqualToString:@""]||codeNumber==nil){
        [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
        return NO;
    }else if([passwd isEqualToString:@""]||passwd==nil){
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        return NO;
    }else if([passwdConfirm isEqualToString:@""]||passwdConfirm==nil||![passwdConfirm isEqualToString:passwd]){
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致"];
        return NO;
    }else{
        return YES;
    }
}
@end
