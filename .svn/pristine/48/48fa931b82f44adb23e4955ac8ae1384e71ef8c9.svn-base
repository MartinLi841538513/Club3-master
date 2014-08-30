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

@implementation RegisterService

-(void)sendCodeActionWithLoginname:(NSString *)name{
    NSLog(@"%@",ValicodeURL);
    NSString *urlString = [NSString stringWithFormat:ValicodeURL,name];
    NSLog(@"%@",urlString);
//    NSString *urlString = ValicodeURL
//    if (name==nil||[name isEqualToString:@""]) {
//        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
//    }else{
//        [InternetRequest dispatch_aync_LoadDataWithUrlString:; complite:
//    }
}

-(void)registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm onViewController:(RegisterViewController *)viewController{
    if ([self validateRegisterName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm]) {
        [viewController.navigationController popViewControllerAnimated:YES];
        [viewController.delegate registerSuccessWithLoginname:name andPasswd:passwd];
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
        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        return YES;
    }
}
@end
