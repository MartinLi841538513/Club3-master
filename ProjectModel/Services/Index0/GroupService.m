//
//  GroupService.m
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "GroupService.h"
#import "JSONModelLib.h"
#import "SVProgressHUD.h"
#import "Groups.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "MyMD5.h"
#import "Status.h"
#import "SVProgressHUD.h"
@implementation GroupService
-(void)loadCurrentGroupDataInViewController:(GroupsViewController *)viewController{

    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    
    NSString *urlString = [NSString stringWithFormat:GroupsURL,userModel.mid,@"2",@"1"];
    Groups *groups = [[Groups alloc] initFromURLWithString:urlString completion:^(Groups *model,JSONModelError *error){
        NSLog(@"%@ ,%@",groups,urlString);
        viewController.datas = model.info.goods;
        [viewController.tableview reloadData];
    }];
}

-(void)addToGroupInViewController:(GroupDetailViewController *)viewController withPassword:(NSString *)password{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSString *gid = viewController.groupGood.gid;
    NSString *nums = viewController.number.text;
    NSString *passwd = [MyMD5 md5:password];
    NSString *urlString = [NSString stringWithFormat:GroupSignUp,mid,gid,nums,passwd];
    NSLog(@"%@",urlString);
    Status *status = [[Status alloc] initFromURLWithString:urlString completion:^(Status *model,NSError *error){
        NSLog(@"%@",status);
        if (model.status == 2) {
            [SVProgressHUD showSuccessWithStatus:@"加入团购成功"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"加入团购失败"];
        }
    }];
}

/*
    秒转化成详细时间
 */
-(NSString *)toDetailTime:(int)seconds{
    int second = seconds % 60;
    int minute = (seconds-second)/60%60;
    int hour = (seconds-second-minute*60)/60/60%24;
    int day = (seconds-second-minute*60-hour*60*24)/60/60/24%24;
    
    NSString *detailTime = [NSString stringWithFormat:@"还剩%d天 %d:%d:%d",day,hour,minute,second];
    return detailTime;
}
@end
