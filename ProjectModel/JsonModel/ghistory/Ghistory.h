//
//  Mhistory.h
//  Club
//
//  Created by MartinLi on 14-8-30.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"
#import "PastItemInfo.h"
@interface Ghistory : JSONModel
@property(nonatomic,strong)NSArray<PastItemInfo> *info;
@property(nonatomic,assign)NSInteger status;
@end
