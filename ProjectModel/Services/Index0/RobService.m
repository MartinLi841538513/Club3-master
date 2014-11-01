//
//  RobService.m
//  Club
//
//  Created by dongway on 14-8-19.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RobService.h"
#import "SVProgressHUD.h"
#import "RobModel.h"
#import "RobDao.h"
#import "NSString+MT.h"

#import "UserDefaults.h"
#import "UserModel.h"
#import "Mhistory.h"
#import "JSONModelLib.h"
#import "Ghistory.h"
#import "NSString+MT.h"

@implementation RobService

-(void)setRobModelWithSid:(NSString *)sid inViewController:(RobViewController *)viewController{
    [SVProgressHUD showWithStatus:@"正在加载今日抢菜数据......"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        RobDao *robdao = [[RobDao alloc] init];
        RobModel *model = [robdao robWithSid:sid];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (model==nil) {
                [SVProgressHUD showErrorWithStatus:@"失败"];
            }else{
                viewController.robModel = model;
                [self setItemInfosWithController:viewController];
                if ([model.starttime compareCurrentTimeWith:model.starttime]==NSOrderedDescending) {
                    [SVProgressHUD showErrorWithStatus:@"未到抢菜时间"];
                }else{
                    [SVProgressHUD dismiss];
                }
            }
        });
    });
}

-(void)setItemInfosWithController:(RobViewController *)viewController{
    NSString *startTime = viewController.robModel.starttime;
    NSString *startTitle = [NSString stringWithFormat:@"%@开抢",[startTime timeType2FromStamp:startTime]];
    [viewController.startTimeButton setTitle:startTitle forState:UIControlStateNormal];
    viewController.itemImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,viewController.robModel.picture]]]];
    viewController.date.text = [NSString stringWithFormat:@"%@供抢",viewController.robModel.qiang];
    viewController.itemNameLabel.text = viewController.robModel.name;
    viewController.itemPastPriceLabel.text = [NSString stringWithFormat:@"原价：%@元/%@", viewController.robModel.price,viewController.robModel.unit];
    NSString *discount = viewController.robModel.discount;
    if ([discount floatValue] == 0){
        viewController.discount.text = [NSString stringWithFormat:@"抢购价:免费"];
    }else{
        viewController.discount.text = [NSString stringWithFormat:@"抢购价:%@",discount];
    }
    viewController.itemCount.text = [NSString stringWithFormat:@"抢购总数量：%@%@",viewController.robModel.nums,viewController.robModel.unit];
}

//开抢
-(void)robWithMid:(NSString *)mid andSid:(NSString *)sid andRobModel:(RobModel *)robModel{
    if ([robModel.starttime compareCurrentTimeWith:robModel.starttime]==NSOrderedDescending) {
        
        [SVProgressHUD showErrorWithStatus:@"未到抢菜时间"];
    }else{
        [SVProgressHUD showWithStatus:@"正在努力抢菜中......."];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            RobDao *robdao = [[RobDao alloc] init];
            NSNumber *result = [robdao robWithMid:mid andSid:sid andGid:robModel.gid];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if ([result isEqual:[NSNumber numberWithInt:2]]) {
                    [SVProgressHUD showSuccessWithStatus:@"恭喜抢菜成功，去\"我的订单\"看看你的菜"];
                    
                }else if([result isEqual:[NSNumber numberWithInt:822]]){
                    [SVProgressHUD showErrorWithStatus:@"你已完成今日抢菜，请去\"我的订单\"查看您抢的菜"];
                }else if([result isEqual:[NSNumber numberWithInt:823]]){
                    [SVProgressHUD showErrorWithStatus:@"商品已过期"];
                }else{
                    [SVProgressHUD showErrorWithStatus:@"很遗憾，没抢到"];
                    NSLog(@"%@",result);
                }
            });
        });
    }
}


//抢菜记录
-(void)loadRecordsInRecordsController:(RobedRecordsTableViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *urlString = [NSString stringWithFormat:RobRecordURL,userModel.sid,@"1"];
    NSLog(@"%@ ",urlString);
    Mhistory *mhistory = [[Mhistory alloc] initFromURLWithString:urlString completion:^(Mhistory *object,JSONModelError *error){
        NSLog(@"%@",mhistory);
        if (object.status == 2) {
            viewController.datas = object.info.mem;
            [viewController.tableView reloadData];
        }else{
            NSLog(@"%@",error);
            [SVProgressHUD showErrorWithStatus:@"没有数据"];
        }
    }];
}

//查看往期抢菜商品
-(void)loadItemsInPastItemsController:(PastItemsTableViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *urlString = [NSString stringWithFormat:PastRobItemsURL,userModel.sid,@"1"];
    NSLog(@"%@ ",urlString);
    Ghistory *history = [[Ghistory alloc] initFromURLWithString:urlString completion:^(Ghistory *object,JSONModelError *error){
        NSLog(@"%@",history);
        if (object.status == 2) {
            viewController.datas = object.info;
            [viewController.tableView reloadData];
        }else{
            NSLog(@"%@",error);
            [SVProgressHUD showErrorWithStatus:@"没有数据"];
        }
    }];
}
@end
