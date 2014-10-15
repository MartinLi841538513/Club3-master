//
//  GroupsViewController.h
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray *datas;
@end
