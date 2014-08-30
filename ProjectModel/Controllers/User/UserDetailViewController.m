//
//  UserDetailViewController.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "UserDetailViewController.h"
#import "UserDetailService.h"
#import "UserDefaults.h"
#import "UserModel.h"

@interface UserDetailViewController ()
{
    
    __weak IBOutlet UIButton *logoutButton;
    UserDetailService *userDetailService;
}
@end

@implementation UserDetailViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        userDetailService = [[UserDetailService alloc] init];
    }
    return self;
}

-(void)loadView{
    [super loadView];
    logoutButton.frame = CGRectMake(20, DeviceFrame.size.height-NavigationBarFrame.size.height-10, 280, 38);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的信息";
    [self setView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logoutAction:(id)sender {
    [userDetailService loginoutActionInViewController:self];
}

#pragma LoginViewControllerDelegate
-(void)loginSuccessedActionWithViewController:(UIViewController *)viewController{
    [viewController.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma Notification
/*
 1，在当前viewcontroller loadData
 */
-(void)loginSuccessAction:(NSNotification *)nc{
    [self loadData];
}

//加载数据
-(void)loadData{
    [self setView];
}

-(void)setView{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    
    self.username.text = userModel.nickname;
    self.account.text = userModel.loginname;
    self.phone.text = userModel.mobile;
    self.address.text = [NSString stringWithFormat:@"%@%@",userModel.sname,userModel.address];
}


@end
