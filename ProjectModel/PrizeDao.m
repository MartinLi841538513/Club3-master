//
//  PrizeDao.m
//  Club
//
//  Created by dongway on 14-8-18.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PrizeDao.h"
#import "InternetRequest.h"

@implementation PrizeDao

-(PrizeModel *)takeLotteryWithUserId:(NSString *)userId{
    NSString *urlString = [NSString stringWithFormat:LottryURL,userId];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    PrizeModel *model = [[PrizeModel alloc] init];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        NSDictionary *dict = [result objectForKey:@"info"];
        model = [self modelWithDict:dict];
        return model;
    }else{
        return nil;
    }
}

-(NSArray *)modelsWithDicts:(NSArray *)dicts{
    NSMutableArray *models = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in dicts){
        PrizeModel *model = [self modelWithDict:dict];
        [models addObject:model];
    }
    return models;
}


-(PrizeModel *)modelWithDict:(NSDictionary *)dict{
    PrizeModel *model = [[PrizeModel alloc] init];
    model.peoples = [dict valueForKey:@"peoples"];
    model.nums = [dict valueForKey:@"nums"];
    model.serialid = [dict valueForKey:@"serialid"];
    return model;
}

@end
