//
//  MyOrderViewController.m
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderCell.h"
#import "TradeOrderCell.h"
#import "RobOrderData.h"
#import <UIImageView+WebCache.h>
#import "NSString+MT.h"
#import "MyOrderService.h"
#import "OrderDetailData.h"
#import "MyGroupCell.h"
#import "MyGroups.h"
@interface MyOrderViewController ()
{
    MyOrderService *myOrderService;
}
@end

@implementation MyOrderViewController

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
    myOrderService = [[MyOrderService alloc] init];
    [myOrderService loadTradeOrderInViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.orderType==TradeOrderType) {
        TradeOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TradeOrderCell"];
        NSInteger row = indexPath.row;
        TradeOrder *order = [self.items objectAtIndex:row];
        cell.demo.text = order.demo;
        NSString *stamp = order.regtime;
        cell.time.text = [stamp timeType3FromStamp:stamp];
        cell.total.text = [NSString stringWithFormat:@"￥:%@元",order.totals];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if(self.orderType==RobOrderType){
        OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell"];
        NSInteger row = indexPath.row;
        RobOrder *order = [self.items objectAtIndex:row];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,order.picture]]];
        cell.name.text = order.name;
        NSString *stamp = order.regtime;
        cell.time.text = [stamp timeType3FromStamp:stamp];
        cell.status.text = order.status;
        return cell;
    }else if(self.orderType==GroupOrderType){
        MyGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyGroupCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        MyGroupOrder *order = [self.items objectAtIndex:row];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,order.picture]]];
        cell.name.text = order.gname;
        cell.discount.text = [NSString stringWithFormat:@"%@元/%@",order.discount,order.unit];
        cell.price.text = [NSString stringWithFormat:@"%@元/%@",order.price,order.unit];
        cell.time.text = order.regtime;
        cell.number.text = order.nums;
        cell.status.text = order.status;
        return cell;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{    if (self.orderType==RobOrderType) {
        return 90.0f;
    }else if(self.orderType==TradeOrderType){
        return 57.0f;
    }else if(self.orderType==GroupOrderType){
        return 119.0f;
    }else{
        return 0;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (self.orderType == TradeOrderType) {
        NSInteger row = indexPath.row;
        TradeOrder *order = [self.items objectAtIndex:row];
        [myOrderService pushToDetailViewControllerWithItem:order onViewController:self];
    }
}

- (IBAction)swicthAction:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    if (seg.selectedSegmentIndex==0) {
        [myOrderService loadTradeOrderInViewController:self];
    }else if(seg.selectedSegmentIndex==1){
        [myOrderService loadRobOrderInViewController:self];
    }else if (seg.selectedSegmentIndex==2){
        [myOrderService loadGroupOrderInViewController:self];
    }
}



@end
