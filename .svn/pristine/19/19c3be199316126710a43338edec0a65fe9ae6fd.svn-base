//
//  Index4Service.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index4Service.h"
#import "UserInfosDao.h"
#import "UserInfosModel.h"

@implementation Index4Service

-(void)printUserinfos:(NSArray *)userinfos{
    for(UserInfosModel *model in userinfos){
        NSLog(@"%@",model.userName);
    }
}

-(NSArray *)getUserinfosWithUsername:(NSString *)username andPassword:(NSString *)password{
    UserInfosDao *dao = [[UserInfosDao alloc] init];
    NSArray *userinfos = [dao getUserinfosWithUserName:username andUserPword:password];
    return userinfos;
}

@end
