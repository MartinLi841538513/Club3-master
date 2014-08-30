//
//  ItemDetailService.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ItemDetailService.h"
#import "PurchaseCarItemsViewController.h"

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
    跳转至购物篮
 */
-(void)presentPurchaseCarViewControllerOnViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PurchaseCarItemsViewController *itemsViewContrller = [storyboard instantiateViewControllerWithIdentifier:@"PurchaseCarItemsViewController"];
    [viewController.navigationController pushViewController:itemsViewContrller animated:YES];
}

@end
