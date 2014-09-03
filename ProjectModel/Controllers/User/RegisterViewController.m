//
//  RegisterViewController.m
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterService.h"
#import "Index1Service.h"
@interface RegisterViewController ()
{
    __weak IBOutlet UITextField *loginname;
    __weak IBOutlet UITextField *code;
    __weak IBOutlet UITextField *password;
    __weak IBOutlet UITextField *Passwd;
    RegisterService *registerService;
    UIKeyboardViewController *keyBoardController;
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
    keyBoardController = [[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    [keyBoardController addToolbarToKeyboard];
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
    [registerService registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm onViewController:self];
}

- (IBAction)checkProtocolAction:(id)sender {
    self.checkButton.tag = -self.checkButton.tag;
    if (self.checkButton.tag==1) {
        [self.checkButton setImage:[UIImage imageNamed:@"checked_true.png"] forState:UIControlStateNormal];
    }else if(self.checkButton.tag == -1){
        [self.checkButton setImage:[UIImage imageNamed:@"checked_false.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)readProtocolAction:(id)sender {
    Index1Service *service = [[Index1Service alloc] init];
    [service loadWebViewWithURLString:ProtocolURL andTitle:@"服务协议" onViewContrller:self];
}


@end
