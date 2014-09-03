//
//  LoginViewController.h
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "UIKeyboardViewController.h"

@protocol LoginViewControllerDelegate <NSObject>

@optional
-(void)loginSuccessedActionWithViewController:(UIViewController *)viewController;

@end

@interface LoginViewController : UIViewController<RegisterViewControllerDelegate,UIKeyboardViewControllerDelegate>

@property (nonatomic,retain)id<LoginViewControllerDelegate> delegate;

@end
