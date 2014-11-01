//
//  GroupService.h
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupsViewController.h"
#import "GroupDetailViewController.h"
@interface GroupService : NSObject
-(void)loadCurrentGroupDataInViewController:(GroupsViewController *)viewController;
-(void)addToGroupInViewController:(GroupDetailViewController *)viewController withPassword:(NSString *)password;
-(NSString *)toDetailTime:(NSInteger)seconds;
@end
