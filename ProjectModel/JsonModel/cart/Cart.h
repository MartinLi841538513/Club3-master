//
//  Cart.h
//  Club
//
//  Created by dongway on 14-8-28.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"
#import "CartInfo.h"
@interface Cart : JSONModel

@property(nonatomic,strong)CartInfo *info;
@property(nonatomic,assign)NSInteger status;

@end
