//
//  Mhistory.h
//  Club
//
//  Created by MartinLi on 14-8-30.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"
#import "RobRecordInfo.h"
@interface Mhistory : JSONModel

@property(nonatomic,strong)RobRecordInfo *info;
@property(nonatomic,assign)NSInteger status;


@end
