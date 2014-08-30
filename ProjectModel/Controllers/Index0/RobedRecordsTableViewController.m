//
//  RobedRecordsTableViewController.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RobedRecordsTableViewController.h"
#import "RobedRecordCell.h"
#import "RobedRecordsService.h"
#import "RobRecorder.h"
#import "NSString+MT.h"

@interface RobedRecordsTableViewController ()
{
    NSString *identifer;
}
@end

@implementation RobedRecordsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    [super loadView];
    identifer = @"RobedRecordCell";
    UINib *nib = [UINib nibWithNibName:@"RobedRecordCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:identifer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"抢菜记录";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    RobedRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    RobRecorder *record = [self.datas objectAtIndex:row];
    cell.nickname.text = record.nickname;
    NSString *stamp = record.regtime;
    cell.time.text = [stamp timeType1FromStamp:stamp];
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 29;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
