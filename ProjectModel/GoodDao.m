//
//  GoodDao.m
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "GoodDao.h"
#import "InternetRequest.h"

@implementation GoodDao

-(NSDictionary *)goodsBySid:(NSString *)sid andGtypeid:(NSString *)gtypeid andPage:(NSString *)page{
    NSString *urlString = [NSString stringWithFormat:GoodsURL,sid,gtypeid,page];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        NSDictionary *dict = [result objectForKey:@"info"];
        NSDictionary *dicts = [dict objectForKey:@"goods"];
        return dicts;
    }else{
        return nil;
    }
}

//加入购物车
-(BOOL)addToPurchaseCarWithMid:(NSString *)mid andGid:(NSString *)gid andNum:(NSString *)num{
    NSString *urlString = [NSString stringWithFormat:InCartURL,mid,gid,num];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        return YES;
    }else{
        return NO;
    }
}


-(NSArray *)modelsWithDicts:(NSArray *)dicts{
    NSMutableArray *models = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in dicts){
        GoodModel *model = [self modelWithDict:dict];
        [models addObject:model];
    }
    return models;
}

-(GoodModel *)modelWithDict:(NSDictionary *)dict{
    GoodModel *model = [[GoodModel alloc] init];
    model.bigpicture = [dict valueForKey:@"bigpicture"];
    model.name = [dict valueForKey:@"name"];
    model.picture = [dict valueForKey:@"picture"];
    model.unit = [dict valueForKey:@"unit"];
    model.discount = [dict valueForKey:@"discount"];
    model.gid = [dict valueForKey:@"gid"];
    model.price = [dict valueForKey:@"price"];
    return model;
}
@end
