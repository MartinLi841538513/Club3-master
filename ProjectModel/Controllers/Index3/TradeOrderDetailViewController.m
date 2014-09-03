//
//  TradeOrderDetailViewController.m
//  Club
//
//  Created by dongway on 14-9-1.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "TradeOrderDetailViewController.h"
#import "TradeOrderDetailCell.h"
#import "OrderDetailData.h"
#import <UIImageView+WebCache.h>
@interface TradeOrderDetailViewController ()

@end

@implementation TradeOrderDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TradeOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TradeOrderDetailCell"];
    NSInteger row = indexPath.row;
    OrderDetail *order = [self.items objectAtIndex:row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,order.picture]]];
    cell.name.text = order.name;
    cell.num.text = [NSString stringWithFormat:@"数量:%@",order.num];
    cell.discount.text = [NSString stringWithFormat:@"单价:%@",order.discount];
    cell.total.text = [NSString stringWithFormat:@"总价:%@",order.total];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
