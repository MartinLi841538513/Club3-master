//
//  DatasTableViewController.h
//  Club
//
//  Created by dongway on 14-8-17.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatasTableViewControllerDelegate <NSObject>

-(void)popViewControllerWithData:(NSDictionary *)data andIndex:(NSInteger)index;

@end

@interface DatasTableViewController : UITableViewController

@property(nonatomic,retain)id<DatasTableViewControllerDelegate>delegate;

@property(nonatomic,assign)NSInteger index;
@property(nonatomic,retain)NSArray *datas;

@end
