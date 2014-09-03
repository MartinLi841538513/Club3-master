//
//  Amount.h
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol Trade <NSObject>
@end
@interface Trade : JSONModel
@property(nonatomic,strong)NSString *regtime;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *balance;
@property(nonatomic,strong)NSString *demo;
@end


@interface Info : JSONModel
@property(nonatomic,strong)NSString *iccard;
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *redbag;
@property(nonatomic,strong)NSArray<Trade> *trade;
@end


@interface Amount : JSONModel
@property(nonatomic,strong)Info* info;
@property(nonatomic,assign)NSInteger status;
@end

