//
//  GroupsViewController.m
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "GroupsViewController.h"
#import "CurrentGroupCell.h"
#import "GroupService.h"
#import "Groups.h"
#import <UIImageView+WebCache.h>
#import "GroupDetailViewController.h"
@interface GroupsViewController ()
{
    GroupService *groupService;
}
@end

@implementation GroupsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    groupService = [[GroupService alloc] init];
    [groupService loadCurrentGroupDataInViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"currentGroupCell";
    CurrentGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    GroupGood *model = [self.datas objectAtIndex:row];
    cell.name.text = model.name;
    cell.price.text = [NSString stringWithFormat:@"%@%@",model.price,model.unit];
    cell.discount.text = [NSString stringWithFormat:@"%@%@",model.discount,model.unit];
    cell.endTime.text = [NSString stringWithFormat:@"%@截止",model.end_time];
    cell.number.text = [NSString stringWithFormat:@"当前参团人数:%@",model.actual_num];
    cell.expectNumber.text = [NSString stringWithFormat:@"%@人起团",model.expect_num];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,model.picture]]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    GroupGood *groupGood = [self.datas objectAtIndex:row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GroupDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"GroupDetailViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.groupGood = groupGood;
}


@end
