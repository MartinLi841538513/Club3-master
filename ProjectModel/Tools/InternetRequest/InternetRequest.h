//
//  InternetRequest.h
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InternetRequest : NSObject

+(void)dispatch_aync_LoadDataWithUrlString:(NSString *)urlString complite:(void(^)(id dict))compliteAction;

+(NSDictionary *)loadDataWithUrlString:(NSString *)urlString;

+(id)postUrlString:(NSString *)urlString withDict:(NSDictionary *)dict;
+(id)postUrlString:(NSString *)urlString withDict:(NSDictionary *)dict andImagePath:(NSString *)imagePath andImageName:(NSString *)imageName;
@end
