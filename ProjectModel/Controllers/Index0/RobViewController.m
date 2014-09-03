//
//  BuyOrRobViewController.m
//  Club
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RobViewController.h"
#import "PastItemsTableViewController.h"
#import "RobedRecordsTableViewController.h"
#import "RobService.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "NSString+MT.h"
@interface RobViewController ()
{
    
    RobService *robService;
    UserModel *userModel;
}
@end

@implementation RobViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        robService = [[RobService alloc] init];
        UserDefaults *userDefaults = [[UserDefaults alloc] init];
        userModel = userDefaults.userModel;
    }
    return self;
}

-(void)loadView{
    [super loadView];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"免费抢";
    
    //给 self.robModel
    [robService setRobModelWithSid:userModel.sid inViewController:self];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"robRecords"]) {
        //抢菜记录
        RobedRecordsTableViewController *viewController = segue.destinationViewController;
        [robService loadRecordsInRecordsController:viewController];
    }else if([segue.identifier isEqualToString:@"pastItems"]){
        PastItemsTableViewController *viewController = segue.destinationViewController;
        [robService loadItemsInPastItemsController:viewController];
    }
}

//抢
- (IBAction)buyOrRobAction:(id)sender {
    [robService robWithMid:userModel.mid andSid:userModel.sid andRobModel:self.robModel];
}








@end
