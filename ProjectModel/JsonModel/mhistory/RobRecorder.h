//
//  RobRecord.h
//  Club
//
//  Created by MartinLi on 14-8-30.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol RobRecorder @end

@interface RobRecorder : JSONModel

@property(nonatomic,strong)NSString *loginname;
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *regtime;

@end
