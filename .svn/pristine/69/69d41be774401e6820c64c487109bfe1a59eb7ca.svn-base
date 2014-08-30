//
//  SelectedItemsTableViewController.h
//  Club
//
//  Created by dongway on 14-8-13.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectedItemsTableViewControllerDelegate <NSObject>

-(void)tableView:(UITableView *)tableView didSelectedCell:(UITableViewCell *)tableViewCell withController:(UIViewController *)viewController;

@end

@interface SelectItemsTableViewController : UITableViewController

@property (nonatomic,retain)id<SelectedItemsTableViewControllerDelegate> delegate;

@property (nonatomic,retain)NSArray *datas;

@end
