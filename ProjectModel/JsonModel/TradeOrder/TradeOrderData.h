//
//  TradeOrderData.h
//  Club
//
//  Created by dongway on 14-9-1.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol TradeOrder <NSObject>
@end
@interface TradeOrder : JSONModel
@property(nonatomic,strong)NSString *orderid;
@property(nonatomic,strong)NSString *regtime;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *totals;
@property(nonatomic,strong)NSString<Optional> *demo;
@end

@interface TradeOrderInfo : JSONModel
@property(nonatomic,strong)NSArray<TradeOrder>* order;
@end

@interface TradeOrderData : JSONModel
@property(nonatomic,strong)TradeOrderInfo* info;
@property(nonatomic,assign)NSInteger status;
@end
