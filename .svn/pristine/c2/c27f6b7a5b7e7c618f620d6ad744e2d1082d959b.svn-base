//
//  RegisterViewController.h
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterViewControllerDelegate <NSObject>

@optional
-(void)registerSuccessWithLoginname:(NSString *)name andPasswd:(NSString *)passwd;

@end

@interface RegisterViewController : UIViewController

@property(nonatomic,retain)id<RegisterViewControllerDelegate> delegate;

@end
