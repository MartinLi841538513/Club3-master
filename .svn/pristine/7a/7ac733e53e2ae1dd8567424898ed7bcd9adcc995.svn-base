//
//  RewardRecordsViewController.m
//  Club
//
//  Created by dongway on 14-8-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RewardRecordsViewController.h"
#import "RewardCell.h"

@interface RewardRecordsViewController ()
{
    
    __weak IBOutlet UITableView *tableview;
    NSArray *titles;
    NSArray *times;
    NSString *identifier;
}
@end

@implementation RewardRecordsViewController

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
    identifier = @"RewardCell";
    UINib *nib = [UINib nibWithNibName:@"RewardCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:identifier];
    tableview.delegate = self;
    tableview.dataSource = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"中奖记录";
    titles = [[NSArray alloc] initWithObjects:@"¥1.80",@"¥2.80",@"¥3.80",@"¥4.80",@"¥5.80",@"¥6.80",@"¥7.80",@"¥8.80",@"¥9.80",@"¥10.80", nil];
    times = [[NSArray alloc] initWithObjects:@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21",@"2014-08-21", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = indexPath.row;
    RewardCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.rewardValue.text = [titles objectAtIndex:row];
    cell.time.text = [times objectAtIndex:row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}


@end
