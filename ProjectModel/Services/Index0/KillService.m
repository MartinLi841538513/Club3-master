//
//  KillService.m
//  Club
//
//  Created by MartinLi on 14-10-22.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "KillService.h"
#import "JSONModelLib.h"
#import "Kills.h"
#import "UserDefaults.h"
#import "UserModel.h"

@implementation KillService

-(void)loadKillListInViewController:(KillListViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    
    NSString *urlString = [NSString stringWithFormat:GroupsURL,userModel.mid,@"2",@"1"];
    NSLog(@"%@",urlString);
    Kills *groups = [[Kills alloc] initFromURLWithString:urlString completion:^(Kills *model,JSONModelError *error){
        NSLog(@"%@ ,%@",groups,urlString);
        viewController.datas = model.info.goods;
        [viewController.tableview reloadData];
    }];

}

@end
