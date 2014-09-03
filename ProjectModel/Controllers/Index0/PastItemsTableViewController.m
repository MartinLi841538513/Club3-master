//
//  PastItemsTableViewController.m
//  Club
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PastItemsTableViewController.h"
#import "PastRobItemCell.h"
#import "PastItemInfo.h"
#import <UIImageView+WebCache.h>
#import "NSString+MT.h"
@interface PastItemsTableViewController ()
{

}
@end

@implementation PastItemsTableViewController

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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"往期免费抢商品";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
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
    static NSString *identifier = @"PastRobItemCell";
    UINib *nib = [UINib nibWithNibName:@"PastRobItemCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    PastRobItemCell *cell = (PastRobItemCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    // Configure the cell...
    PastItemInfo *item = [self.datas objectAtIndex:row];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",IP,item.picture]);
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,item.picture]]];
    cell.name.text = [NSString stringWithFormat:@"%@",item.name];
    cell.pastPrice.text = [NSString stringWithFormat:@"原价:%@元/%@",item.price,item.unit];
    NSString *stamp = item.qday;
    stamp = [stamp timeType3FromStamp:stamp];
    cell.period.text = [NSString stringWithFormat:@"%@",stamp];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90.0f;
}
@end
