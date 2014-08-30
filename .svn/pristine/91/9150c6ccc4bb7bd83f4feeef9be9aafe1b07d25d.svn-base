//
//  UserDefaults.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults

-(id)init
{
    if(self = [super init])
    {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

//登陆状态
-(void)setIsLogin:(NSString *)isLogin
{
    [self.userDefaults setValue:isLogin forKey:@"isLogin"];
    [self.userDefaults synchronize];
}

-(NSString *)isLogin
{
    return [self.userDefaults valueForKey:@"isLogin"];
}

//登陆状态
-(void)setUserModel:(UserModel *)userModel
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userModel];
    [self.userDefaults setObject:data forKey:@"userModel"];
    [self.userDefaults synchronize];
}

-(UserModel *)userModel
{
    NSData *data = [self.userDefaults objectForKey:@"userModel"];
    UserModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return model;
}

@end
