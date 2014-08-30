//
//  CartInfo.h
//  Club
//
//  Created by dongway on 14-8-28.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"
#import "Good.h"
@interface CartInfo : JSONModel
@property(nonatomic,strong)NSString *redbag;
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSArray<Good> *goods;
@end
