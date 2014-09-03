//
//  RobOrder.h
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol RobOrder <NSObject>
@end
@interface RobOrder : JSONModel
@property(nonatomic,strong)NSString *orderid;
@property(nonatomic,strong)NSString *gid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *regtime;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *picture;
@property(nonatomic,strong)NSString *discount;
@end

@interface RobOrderInfo : JSONModel
@property(nonatomic,strong)NSArray<RobOrder>* order;
@end

@interface RobOrderData : JSONModel
@property(nonatomic,strong)RobOrderInfo* info;
@property(nonatomic,assign)NSInteger status;
@end
