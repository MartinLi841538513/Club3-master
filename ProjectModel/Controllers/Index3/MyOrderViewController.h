//
//  MyOrderViewController.h
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

enum{
    TradeOrderType,
    RobOrderType
};

@interface MyOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property(nonatomic,assign)NSInteger orderType;

@end
