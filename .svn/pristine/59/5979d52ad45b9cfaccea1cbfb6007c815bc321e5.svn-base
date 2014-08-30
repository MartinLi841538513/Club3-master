//
//  Index3Service.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index3Service.h"
#import "UserDetailViewController.h"
#import "FeedbackViewController.h"
#import "QRCodeViewController.h"
@implementation Index3Service

/*
    用户详情
 */
-(void)presentUserDetailViewControllerOnViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserDetailViewController *userDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"UserDetailViewController"];
    userDetailViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:userDetailViewController animated:YES];
}

/*
    用户反馈
 */
-(void)presentFeedBackViewControllerOnViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FeedbackViewController *feedBackViewController = [storyboard instantiateViewControllerWithIdentifier:@"FeedbackViewController"];
    feedBackViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:feedBackViewController animated:YES];
}

/*
    我的二维码
 */
-(void)presentQRCodeViewControllerOnViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QRCodeViewController *qrCodeViewController = [storyboard instantiateViewControllerWithIdentifier:@"QRCodeViewController"];
    qrCodeViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:qrCodeViewController animated:YES];
}


@end
