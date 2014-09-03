//
//  Index3Service.h
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Index3ViewController.h"
@interface Index3Service : NSObject
-(void)presentUserDetailViewControllerOnViewController:(UIViewController *)viewController;
-(void)presentFeedBackViewControllerOnViewController:(UIViewController *)viewController;
-(void)presentQRCodeViewControllerOnViewController:(UIViewController *)viewController;
-(void)presentMyWalletViewControllerOnViewController:(UIViewController *)viewController;
-(void)presentMyOrderViewControllerOnViewController:(UIViewController *)viewController;
-(void)callInViewController:(Index3ViewController *)viewController;
@end
