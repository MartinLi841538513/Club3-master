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
#import "Status.h"
#import "SVProgressHUD.h"
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
    NSString *urlString = [NSString stringWithFormat:KillCountDownURL,mid,gid];
    [SVProgressHUD show];
    KillCountDown *killCountDown = [[KillCountDown alloc] initFromURLWithString:urlString completion:^(KillCountDown *model,JSONModelError *error){
        NSLog(@"%@",killCountDown);
        if (model.status!=2) {
            [SVProgressHUD showErrorWithStatus:@"时间加载出错，请退出重新加载"];
        }else{
            [self.delegate startCountDownActionWithSeconds:model.info.seconds];
            [SVProgressHUD dismiss];
        }
    }];
}

//秒杀
-(void)killInViewController:(KillDetailViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSString *gid = viewController.good.gid;
    NSString *urlString = [NSString stringWithFormat:KillActionURL,mid,gid];
    Status *status = [[Status alloc] initFromURLWithString:urlString completion:^(Status *model,JSONModelError *error){
        NSLog(@"%@",status);
        if (model.status==823) {
            [SVProgressHUD showErrorWithStatus:@"商品已过期"];
        }else if(model.status==827){
            [SVProgressHUD showErrorWithStatus:@"还没开始呢"];
        }else if(model.status == 2){
            [SVProgressHUD showSuccessWithStatus:@"秒杀成功"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"秒杀失败"];
        }
    }];
}
@end
