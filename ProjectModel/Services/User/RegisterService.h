//
//  RegisterService.h
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterViewController.h"

@interface RegisterService : NSObject

-(void)registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm onViewController:(RegisterViewController *)viewController;
-(void)sendCodeActionWithLoginname:(NSString *)name;
@end
