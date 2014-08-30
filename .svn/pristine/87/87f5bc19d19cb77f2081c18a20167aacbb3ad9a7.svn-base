//
//  RobDao.m
//  Club
//
//  Created by dongway on 14-8-19.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RobDao.h"
#import "InternetRequest.h"
@implementation RobDao

-(RobModel *)robWithSid:(NSString *)sid{
    NSString *urlString = [NSString stringWithFormat:RobModelURL,sid];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    RobModel *model = [[RobModel alloc] init];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        NSDictionary *dict = [result objectForKey:@"info"];
        model = [self modelWithDict:dict];
        return model;
    }else{
        return nil;
    }
}

//开抢
-(NSNumber *)robWithMid:(NSString *)mid andSid:(NSString *)sid andGid:(NSString *)gid{
    
    NSString *urlString = [NSString stringWithFormat:RobActionURL,mid,sid,gid];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    return status;
}


-(RobModel *)modelWithDict:(NSDictionary *)dict{
    RobModel *model = [[RobModel alloc] init];
    model.price = [dict valueForKey:@"price"];
    model.nums = [dict valueForKey:@"nums"];
    model.qiang = [dict valueForKey:@"qiang"];
    model.name = [dict valueForKey:@"name"];
    model.picture = [dict valueForKey:@"picture"];
    model.starttime = [dict valueForKey:@"starttime"];
    model.endtime = [dict valueForKey:@"endtime"];
    model.unit = [dict valueForKey:@"unit"];
    model.discount = [dict valueForKey:@"discount"];
    model.gid = [dict valueForKey:@"gid"];
    model.intro = [dict valueForKey:@"intro"];
    return model;
}


@end
