//
//  RobDao.h
//  Club
//
//  Created by dongway on 14-8-19.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RobModel.h"
@interface RobDao : NSObject
-(RobModel *)robWithSid:(NSString *)sid;
-(NSNumber *)robWithMid:(NSString *)mid andSid:(NSString *)sid andGid:(NSString *)gid;
@end
