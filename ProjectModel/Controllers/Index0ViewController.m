//
//  Index0ViewController.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index0ViewController.h"
#import "RobViewController.h"
#import "BuyViewController.h"
#import "LoginViewOperation.h"
#import "UserDefaults.h"
#import "InternetRequest.h"
#import "Index0Service.h"

@interface Index0ViewController ()
{
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UIButton *robButton;
    __weak IBOutlet UIButton *buyButton;
    
    LoginViewOperation *loginViewOperation;
    Index0Service *index0Service;
}
@end

@implementation Index0ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    [super loadView];
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    if (![[userDefaults isLogin] isEqualToString:@"YES"]) {
        loginViewOperation = [[LoginViewOperation alloc] init];
        [loginViewOperation presentLoginViewControllerInViewController:self];
    }else{
        //需要重新加载userDefaults的数据（可能数据库的数据会经常变化）
        
    }
//    robButton.translatesAutoresizingMaskIntoConstraints = YES;
//    buyButton.translatesAutoresizingMaskIntoConstraints = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgAction:)];
    [imgView addGestureRecognizer:imgTap];

    
//    float space = 5.0;
//    float height = (DeviceFrame.size.height-imgView.frame.origin.y-imgView.frame.size.height-TabBarFrame.size.height-space*3-2)/2.0;
//    robButton.frame = CGRectMake(0, 231, 300, 100);
//    robButton.frame = CGRectMake(0, imgView.frame.origin.y+imgView.frame.size.height+space, DeviceFrame.size.width, height);
//    buyButton.frame = CGRectMake(0, robButton.frame.origin.y+robButton.frame.size.height+space, DeviceFrame.size.width, height);
//    
    index0Service = [[Index0Service alloc] init];
    [index0Service loadUserDefaultsInViewController:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"robAction"]){
        RobViewController *viewController = segue.destinationViewController;
        viewController.hidesBottomBarWhenPushed = YES;
    }else if(sender==buyButton) {
        BuyViewController *viewController = segue.destinationViewController;
        viewController.hidesBottomBarWhenPushed = YES;
    }else if([segue.identifier isEqualToString:@"GroupAction"]){
        UIViewController *viewController = segue.destinationViewController;
        viewController.hidesBottomBarWhenPushed = YES;
    }else if([segue.identifier isEqualToString:@"linkToKillList"]){
        UIViewController *viewController = segue.destinationViewController;
        viewController.hidesBottomBarWhenPushed = YES;
    }
}

-(void)imgAction:(id)sender{
    self.tabBarController.selectedIndex = 1;
}



#pragma LoginViewControllerDelegate
-(void)loginSuccessedActionWithViewController:(UIViewController *)viewController{
    [viewController.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

}

@end
