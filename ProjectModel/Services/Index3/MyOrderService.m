//
//  MyOrderService.m
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "MyOrderService.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "RobOrderData.h"
#import "JSONModelLib.h"
#import "SVProgressHUD.h"
#import "OrderDetailData.h"
@implementation MyOrderService

/*
 加载我购买的订单
 */
-(void)loadTradeOrderInViewController:(MyOrderViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSString *urlString = [NSString stringWithFormat:TradeOrderURL,mid];
    NSLog(@"%@",urlString);
    TradeOrderData *orderData = [[TradeOrderData alloc] initFromURLWithString:urlString completion:^(TradeOrderData *object,JSONModelError *error){
        NSLog(@"%@",orderData);
        if (!error) {
            NSInteger status = object.status;
            if (status==2) {
                TradeOrderInfo *info = object.info;
                NSArray *orders = info.order;
                viewController.items = orders;
            }else if(status==840){
                viewController.items = nil;
                [SVProgressHUD showErrorWithStatus:@"没有数据"];
            }else{
                viewController.items = nil;
                [SVProgressHUD showErrorWithStatus:@"数据加载错误"];
            }
        }else{
            viewController.items = nil;
            [SVProgressHUD showErrorWithStatus:@"没有数据"];
            NSLog(@"%@",error);
        }
        viewController.orderType = TradeOrderType;
        [viewController.tableview reloadData];
    }];
}
/*
    加载抢菜订单
 */
-(void)loadRobOrderInViewController:(MyOrderViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSString *page = @"1";
    NSString *urlString = [NSString stringWithFormat:RobOrderURL,mid,page];
    NSLog(@"%@",urlString);
    RobOrderData *robOrderData = [[RobOrderData alloc] initFromURLWithString:urlString completion:^(RobOrderData *object,JSONModelError *error){
        NSLog(@"%@",robOrderData);
        if (!error) {
            NSInteger status = object.status;
            if (status==2) {
                RobOrderInfo *info = object.info;
                NSArray *orders = info.order;
                viewController.items = orders;

                NSLog(@"%@",orders);
            }else if(status==840){
                viewController.items = nil;
                [SVProgressHUD showErrorWithStatus:@"没有数据"];
            }else{
                viewController.items = nil;
                [SVProgressHUD showErrorWithStatus:@"数据加载错误"];
            }
        }else{
            viewController.items = nil;
            [SVProgressHUD showErrorWithStatus:@"没有数据"];
            NSLog(@"%@",error);
        }
        viewController.orderType = RobOrderType;
        [viewController.tableview reloadData];
    }];
}

/*
    订单详情
 */
-(void)pushToDetailViewControllerWithItem:(TradeOrder *)item onViewController:(MyOrderViewController *)myOrderViewController{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TradeOrderDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"TradeOrderDetailViewController"];
    [myOrderViewController.navigationController pushViewController:viewController animated:YES];
    NSString *urlString = [NSString stringWithFormat:DetailTradeOrderURL,item.orderid];
    NSLog(@"%@",urlString);
    OrderDetailData *robOrderData = [[OrderDetailData alloc] initFromURLWithString:urlString completion:^(OrderDetailData *object,JSONModelError *error){
        NSLog(@"%@",robOrderData);
        if (!error) {
            NSInteger status = object.status;
            if (status==2) {
                OrderDetailInfo *info = object.info;
                viewController.items = info.goods;
            }else if(status==840){
                viewController.items = nil;
                [SVProgressHUD showErrorWithStatus:@"没有数据"];
            }else{
                viewController.items = nil;
                [SVProgressHUD showErrorWithStatus:@"数据加载错误"];
            }
        }else{
            viewController.items = nil;
            [SVProgressHUD showErrorWithStatus:@"没有数据"];
            NSLog(@"%@",error);
        }
        [viewController.tableview reloadData];
    }];


}


@end
