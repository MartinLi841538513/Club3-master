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
#import "KillCountDown.h"
@implementation KillService

-(void)loadKillListInViewController:(KillListViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    
    NSString *urlString = [NSString stringWithFormat:KillsURL,userModel.mid,@"2",@"1"];
    NSLog(@"%@",urlString);
    Kills *kills = [[Kills alloc] initFromURLWithString:urlString completion:^(Kills *model,JSONModelError *error){
        NSLog(@"%@ ,%@",kills,urlString);
        viewController.datas = model.info.goods;
        [viewController.tableview reloadData];
    }];

}

-(void)loadCountDownInViewController:(KillDetailViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSString *gid = viewController.good.gid;
//    NSString *urlString = [[NSString ]]
//    KillCountDown *killCountDown = [[KillCountDown alloc] initFromURLWithString:<#(NSString *)#> completion:<#^(id model, JSONModelError *err)completeBlock#>]
}

@end
