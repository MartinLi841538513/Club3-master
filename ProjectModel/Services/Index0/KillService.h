//
//  KillService.h
//  Club
//
//  Created by MartinLi on 14-10-22.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KillListViewController.h"
#import "KillDetailViewController.h"
@interface KillService : NSObject
-(void)loadKillListInViewController:(KillListViewController *)viewController;
@end
