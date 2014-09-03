//
//  LoginViewController.m
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"

@interface LoginViewController ()
{
    __weak IBOutlet UITextField *loginname;
    __weak IBOutlet UITextField *password;
    LoginService *loginService;
    UIKeyboardViewController *keyBoardController;
}
@end

@implementation LoginViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        loginService = [[LoginService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    keyBoardController = [[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    [keyBoardController addToolbarToKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginAction:(id)sender {
    NSString *name = loginname.text;
    NSString *passwd = password.text;
    [loginService loginWithName:name andPasswd:passwd onViewController:self];
}
- (IBAction)registerAction:(id)sender {
    [loginService pushRegisterViewControllerOnViewController:self];
}
- (IBAction)forgetPassword:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请带有效证件到小区生活馆找回密码!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}



#pragma RegisterViewControllerDelegate
//注册成功回调方法
-(void)registerSuccessWithLoginname:(NSString *)name andPasswd:(NSString *)passwd{
    loginname.text = name;
    password.text = passwd;
}

@end
