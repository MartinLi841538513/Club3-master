//
//  OrderDetailData.h
//  Club
//
//  Created by dongway on 14-9-1.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"
@protocol OrderDetail <NSObject>
@end
@interface OrderDetail : JSONModel
@property(nonatomic,strong)NSString *gid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *num;
@property(nonatomic,strong)NSString *total;
@property(nonatomic,strong)NSString *discount;
@property(nonatomic,strong)NSString *picture;
@end

@interface OrderDetailInfo : JSONModel
@property(nonatomic,strong)NSString *redbag;
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,assign)float totals;
@property(nonatomic,strong)NSArray<OrderDetail>* goods;

@end

@interface OrderDetailData : JSONModel
@property(nonatomic,strong)OrderDetailInfo* info;
@property(nonatomic,assign)NSInteger status;
@end
