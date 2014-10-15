//
//  Groups.h
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol GroupGood <NSObject>
@end

@interface GroupGood : JSONModel
@property(nonatomic,strong)NSString *gid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *discount;
@property(nonatomic,strong)NSString *unit;
@property(nonatomic,strong)NSString *picture;
@property(nonatomic,strong)NSString *bigpicture;
@property(nonatomic,strong)NSString *start_time;
@property(nonatomic,strong)NSString *end_time;
@property(nonatomic,strong)NSString *expect_num;
@property(nonatomic,strong)NSString *actual_num;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *isrepeat;
@end

@interface GroupGoodsInfo : JSONModel
@property(nonatomic,strong)NSArray<GroupGood>* goods;
@end

@interface Groups : JSONModel
@property(nonatomic,strong)GroupGoodsInfo* info;
@property(nonatomic,assign)NSInteger status;
@end
