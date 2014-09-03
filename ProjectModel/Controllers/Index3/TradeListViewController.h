//
//  TradeListViewController.h
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TradeCell.h"
#import "Amount.h"
@interface TradeListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property(nonatomic,strong)NSArray<Trade>* items;
@end
