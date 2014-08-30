//
//  RobRecorders.h
//  Club
//
//  Created by MartinLi on 14-8-30.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"
#import "RobRecorder.h"

@interface RobRecordInfo : JSONModel
@property(nonatomic,strong)NSArray<RobRecorder>* mem;
@end
