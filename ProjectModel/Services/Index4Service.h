//
//  Index4Service.h
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Index4Service : NSObject
-(void)printUserinfos:(NSArray *)userinfos;
-(NSArray *)getUserinfosWithUsername:(NSString *)username andPassword:(NSString *)password;
@end
