
//
//  ModelDao.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "UserInfosDao.h"
#import "UserInfosModel.h"
#import "InternetRequest.h"

@implementation UserInfosDao

-(NSArray *)getUserinfosWithUserName:(NSString *)userName andUserPword:(NSString *)userPWord{
    NSString *urlString = @"http://old.idongway.com/sohoweb/q?method=userInfo.get&format=json&userName=tx&userPWord=123456";
    NSMutableArray *models = [[NSMutableArray alloc] init];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSArray *dicts = [result objectForKey:@"userInfos"];
    [models addObjectsFromArray:[self modelsWithDicts:dicts]];
    return models;
}


-(NSArray *)modelsWithDicts:(NSArray *)dicts{
    NSMutableArray *models = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in dicts){
        UserInfosModel *model = [self modelWithDict:dict];
        [models addObject:model];
    }
    return models;
}

-(UserInfosModel *)modelWithDict:(NSDictionary *)dict{
    UserInfosModel *model = [[UserInfosModel alloc] init];
    model.ICCID = [dict valueForKey:@"ICCID"];
    model.passWord = [dict valueForKey:@"passWord"];
    model.ID = [dict valueForKey:@"ID"];
    model.createTime = [dict valueForKey:@"createTime"];
    model.telephone = [dict valueForKey:@"telephone"];
    model.userPoint = [dict valueForKey:@"userPoint"];
    model.email = [dict valueForKey:@"email"];
    model.imageUrl = [dict valueForKey:@"imageUrl"];
    model.IMEI = [dict valueForKey:@"IMEI"];
    model.invitation_code = [dict valueForKey:@"invitation_code"];
    model.invitation_link = [dict valueForKey:@"invitation_link"];
    model.is_verified = [dict valueForKey:@"is_verified"];
    model.cardID = [dict valueForKey:@"cardID"];
    model.userName = [dict valueForKey:@"userName"];
    model.userTitle = [dict valueForKey:@"userTitle"];
    model.is_vip = [dict valueForKey:@"is_vip"];
    model.IMSI = [dict valueForKey:@"IMSI"];
    return model;
}

@end
