//
//  PastItemInfo.h
//  Club
//
//  Created by MartinLi on 14-8-30.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol PastItemInfo <NSObject>



@end

@interface PastItemInfo : JSONModel
@property(nonatomic,strong)NSString *gid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *discount;
@property(nonatomic,strong)NSString *picture;
@property(nonatomic,strong)NSString *unit;
@property(nonatomic,strong)NSString *qday;
@end
