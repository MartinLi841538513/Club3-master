//
//  PurchaseCarItemsService.m
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PurchaseCarItemsService.h"
#import "FinalConfirmViewController.h"
@implementation PurchaseCarItemsService


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
    跳转至最后确认界面
 */
-(void)presentFinalConfirmViewControllerOnViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FinalConfirmViewController *finalViewController = [storyboard instantiateViewControllerWithIdentifier:@"FinalConfirmViewController"];
    [viewController.navigationController pushViewController:finalViewController animated:YES];
}
@end
