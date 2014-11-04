//
//  KillCountDown.h
//  Club
//
//  Created by MartinLi on 14-10-29.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@interface KillCountDownInfo : JSONModel
@property(nonatomic,assign)NSInteger seconds;
@property(nonatomic,strong)NSString *gid;
@property(nonatomic,strong)NSString *actual_num;
//@property(nonatomic,strong)NSString *order;

@end

@interface KillCountDown : JSONModel
@property(nonatomic,strong)KillCountDownInfo *info;
@property(nonatomic,assign)NSInteger status;

@end
