//
//  BuyViewController.h
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCell.h"
#import "MenuListViewController.h"
@interface BuyViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,UITableViewCellDelegate,MenuItemsCollectionControllerDelegate>
@property (nonatomic,strong)NSArray *goods;
@property (nonatomic,strong)UITableView *tableview;
@end
