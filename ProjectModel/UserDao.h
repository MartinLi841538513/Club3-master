//
//  UserDao.h
//  Club
//
//  Created by dongway on 14-8-17.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserDao : NSObject

-(BOOL)sendValidateCodeWithName:(NSString *)name;
-(BOOL)registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm;
-(UserModel *)getUserWithName:(NSString *)name andPassword:(NSString *)passwd;
-(UserModel *)getUserWithName:(NSString *)name;
@end
