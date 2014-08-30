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

@interface RobViewController ()
{
    
    __weak IBOutlet UIImageView *itemImage;
    __weak IBOutlet UILabel *itemNameLabel;
    __weak IBOutlet UILabel *itemPastPriceLabel;
    __weak IBOutlet UILabel *itemRobTimeLabel;
    
    
}
@end

@implementation RobViewController

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

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"抢";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//抢
- (IBAction)buyOrRobAction:(id)sender {
    NSLog(@"buyOrRob");
}

//抢菜记录
- (IBAction)brownRobRecordsAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RobedRecordsTableViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"RobedRecordsTableViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

//查看往期免费商品
- (IBAction)brownPastItemsAction:(id)sender {
    NSLog(@"brownPastItems");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PastItemsTableViewController *viewController = [[PastItemsTableViewController alloc] init];
    viewController = [storyboard instantiateViewControllerWithIdentifier:@"PastItemsTableViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}



@end
