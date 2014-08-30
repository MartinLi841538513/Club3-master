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

@interface Index0ViewController ()
{
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UIButton *robButton;
    __weak IBOutlet UIButton *buyButton;
    
    LoginViewOperation *loginViewOperation;
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
    self.automaticallyAdjustsScrollViewInsets = YES;
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    if (![[userDefaults isLogin] isEqualToString:@"YES"]) {
        loginViewOperation = [[LoginViewOperation alloc] init];
        [loginViewOperation presentLoginViewControllerInViewController:self];
    }
    
    robButton.translatesAutoresizingMaskIntoConstraints = YES;
    buyButton.translatesAutoresizingMaskIntoConstraints = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgAction:)];
    [imgView addGestureRecognizer:imgTap];

    
    float space = 5.0;
    float height = (DeviceFrame.size.height-imgView.frame.origin.y-imgView.frame.size.height-TabBarFrame.size.height-space*3-2)/2.0;
    robButton.frame = CGRectMake(0, 231, 300, 100);
    robButton.frame = CGRectMake(0, imgView.frame.origin.y+imgView.frame.size.height+space, DeviceFrame.size.width, height);
    buyButton.frame = CGRectMake(0, robButton.frame.origin.y+robButton.frame.size.height+space, DeviceFrame.size.width, height);
    
//    [self testPostRequest];
}
//测试post请求，测试完成后要删掉
-(void)testPostRequest{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"object1",@"key1",@"object2",@"key2",@"object3",@"key4", nil];
    NSString *urlString = @"http://192.168.1.102:8080/TestRequest/TestRequest";
//    [InternetRequest postUrlString:urlString withDict:dict];
    [InternetRequest postUrlString:urlString withDict:dict andImagePath:@"" andImageName:@"userIcon.jpg"];
}

-(void)imgAction:(id)sender{
    self.tabBarController.selectedIndex = 1;
}
- (IBAction)robAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RobViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"BuyOrRobViewController"];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)buyAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BuyViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"BuyViewController"];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
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
