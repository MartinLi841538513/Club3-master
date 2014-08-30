//
//  GoodDao.h
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodModel.h"
@interface GoodDao : NSObject
-(NSDictionary *)goodsBySid:(NSString *)sid andGtypeid:(NSString *)gtypeid andPage:(NSString *)page;
-(GoodModel *)modelWithDict:(NSDictionary *)dict;
-(BOOL)addToPurchaseCarWithMid:(NSString *)mid andGid:(NSString *)gid andNum:(NSString *)num;
@end
