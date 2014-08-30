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


#pragma RegisterViewControllerDelegate
//注册成功回调方法
-(void)registerSuccessWithLoginname:(NSString *)name andPasswd:(NSString *)passwd{
    loginname.text = name;
    password.text = passwd;
}

@end
