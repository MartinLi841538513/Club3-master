//
//  MyOrderService.h
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyOrderViewController.h"
#import "TradeOrderData.h"
#import "TradeOrderDetailViewController.h"
@interface MyOrderService : NSObject
-(void)loadTradeOrderInViewController:(MyOrderViewController *)viewController;
-(void)loadRobOrderInViewController:(MyOrderViewController *)viewController;
-(void)pushToDetailViewControllerWithItem:(TradeOrder *)item onViewController:(MyOrderViewController *)myOrderViewController;
@end
