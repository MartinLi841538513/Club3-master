//
//  RobService.h
//  Club
//
//  Created by dongway on 14-8-19.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RobViewController.h"
#import "RobedRecordsTableViewController.h"
#import "PastItemsTableViewController.h"
@interface RobService : NSObject
-(void)setRobModelWithSid:(NSString *)sid inViewController:(RobViewController *)viewController;
-(void)robWithMid:(NSString *)mid andSid:(NSString *)sid andGid:(NSString *)gid;
-(void)loadRecordsInRecordsController:(RobedRecordsTableViewController *)viewController;
-(void)loadItemsInPastItemsController:(PastItemsTableViewController *)viewController;
@end
