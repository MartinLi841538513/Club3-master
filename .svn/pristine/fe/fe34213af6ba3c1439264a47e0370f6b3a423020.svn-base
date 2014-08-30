//
//  LoginViewController.h
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@protocol LoginViewControllerDelegate <NSObject>

@optional
-(void)loginSuccessedActionWithViewController:(UIViewController *)viewController;

@end

@interface LoginViewController : UIViewController<RegisterViewControllerDelegate>

@property (nonatomic,retain)id<LoginViewControllerDelegate> delegate;

@end
