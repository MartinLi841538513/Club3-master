//
//  ItemDetailService.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ItemDetailService.h"
#import "PurchaseCarItemsViewController.h"
#import "SVProgressHUD.h"
#import "GoodDao.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "JSONModelLib.h"
#import "Cart.h"
#import "CartInfo.h"
#import "Good.h"
#import "Status.h"
@implementation ItemDetailService

/*
    数量减1
 */
-(NSString *)reduceNumber:(UILabel *)countLabel{
    int currentCount = [countLabel.text intValue];
    if (currentCount>0) {
        currentCount--;
    }
    return [NSString stringWithFormat:@"%d",currentCount];
}

/*
    数量＋1
 */
-(NSString *)addNumber:(UILabel *)countLabel{
    int currentCount = [countLabel.text intValue];
    if (currentCount<20) {
        currentCount++;
    }
    return [NSString stringWithFormat:@"%d",currentCount];
}

/*
    立即购买
 */
-(void)presentPurchaseCarViewControllerOnViewController:(ItemDetailViewController *)viewController withSegue:(UIStoryboardSegue *)segue andItemCount:(NSString *)count{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    GoodModel *goodModel = viewController.goodModel;
    NSString *urlString1 = [NSString stringWithFormat:InCartURL,userModel.mid,goodModel.gid,count];
    NSLog(@"%@ ",urlString1);
    Status *cart = [[Status alloc] initFromURLWithString:urlString1 completion:^(Status *object,JSONModelError *error){
        NSLog(@"%@",cart);
        if (object.status == 2) {
            [self itemsInCartShowWithSegue:segue];
        }else{
            [SVProgressHUD showErrorWithStatus:@"加入购物车失败"];
        }
    }];
}

/*
    点击购物车
 */
-(void)itemsInCartShowWithSegue:(UIStoryboardSegue *)segue{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *urlString = [NSString stringWithFormat:ItemsInCarURL,userModel.mid];
    NSLog(@"%@",urlString);
    Cart *cart = [[Cart alloc] initFromURLWithString:urlString completion:^(Cart *object,JSONModelError *error){
        NSLog(@"%@",cart);
        if (object.status == 2) {
            PurchaseCarItemsViewController *itemsViewController = segue.destinationViewController;
            itemsViewController.cartInfo = object.info;
            [itemsViewController viewDidLoad];
            [itemsViewController.tableview reloadData];

        }else{
            [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
        }
    }];
}

/*
    加入购物车
 */
-(void)addToPurchaseCarWithGid:(NSString *)gid andNum:(NSString *)num{
    
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        GoodDao *robdao = [[GoodDao alloc] init];
        BOOL result = [robdao addToPurchaseCarWithMid:mid andGid:gid andNum:num];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (result) {
                [SVProgressHUD showSuccessWithStatus:@"操作成功"];
            }else{
                [SVProgressHUD showErrorWithStatus:@"操作失败"];
            }
        });
    });
}

@end
