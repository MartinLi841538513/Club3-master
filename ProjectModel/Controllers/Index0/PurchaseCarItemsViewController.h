//
//  PurchaseCarItemsViewController.h
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseCarItemCell.h"
#import "Good.h"
#import "CartInfo.h"
#import "GoodForSubmit.h"
@interface PurchaseCarItemsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PurchaseCarItemCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UIButton *selectAllButton;
@property (nonatomic,strong)CartInfo *cartInfo;
@property(nonatomic,strong) NSMutableArray<Good>* items;
@property(nonatomic,strong) NSMutableArray<GoodForSubmit>* datasStorage;

@end
