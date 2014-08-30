//
//  RobOrderDao.m
//  Club
//
//  Created by dongway on 14-8-20.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "RobOrderDao.h"
#import "InternetRequest.h"
@implementation RobOrderDao

-(NSArray *)robOrderWithMid:(NSString *)mid andPage:(NSString *)page{
    NSString *urlString = [NSString stringWithFormat:RobOrderModelURL,mid,page];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSArray *orders = [[NSArray alloc] init];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        NSDictionary *dict = [result objectForKey:@"info"];
        NSArray *dicts = [dict objectForKey:@"order"];
        orders = [self modelsWithDicts:dicts];
        return orders;
    }else{
        return nil;
    }
}


-(NSArray *)modelsWithDicts:(NSArray *)dicts{
    NSMutableArray *models = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in dicts){
        RobOrderModel *model = [self modelWithDict:dict];
        [models addObject:model];
    }
    return models;
}


-(RobOrderModel *)modelWithDict:(NSDictionary *)dict{
    RobOrderModel *model = [[RobOrderModel alloc] init];
    model.name = [dict valueForKey:@"name"];
    model.status = [dict valueForKey:@"status"];
    model.gid = [dict valueForKey:@"gid"];
    model.orderid = [dict valueForKey:@"orderid"];
    model.regtime = [dict valueForKey:@"regtime"];
    model.picture = [dict valueForKey:@"picture"];
    return model;
}

@end
