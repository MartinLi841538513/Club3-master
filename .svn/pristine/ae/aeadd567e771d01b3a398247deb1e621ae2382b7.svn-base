//
//  RegisterViewController.m
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterService.h"

@interface RegisterViewController ()
{
    __weak IBOutlet UITextField *loginname;
    __weak IBOutlet UITextField *code;
    __weak IBOutlet UITextField *password;
    __weak IBOutlet UITextField *Passwd;
    RegisterService *registerService;
}
@end

@implementation RegisterViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        registerService = [[RegisterService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendCodeAction:(id)sender {
    NSString *name = loginname.text;
    [registerService sendCodeActionWithLoginname:name];
}


- (IBAction)registerAction:(id)sender {
    NSString *name = loginname.text;
    NSString *codeNumber = code.text;
    NSString *passwd = password.text;
    NSString *passwdConfirm = Passwd.text;
    NSLog(@"%@   %@",passwd,passwdConfirm);
    [registerService registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm onViewController:self];
}



@end
