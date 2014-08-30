//
//  GoodForSubmit.h
//  Club
//
//  Created by dongway on 14-8-29.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GoodForSubmit
@end

@interface GoodForSubmit : NSObject
@property(nonatomic,strong)NSString *cid;
@property(nonatomic,strong)NSString *gid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *num;
@property(nonatomic,strong)NSString *total;
@property(nonatomic,strong)NSString *discount;
@property(nonatomic,strong)NSString *unit;
@property(nonatomic)BOOL isChecked;
@end
