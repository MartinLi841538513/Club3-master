//
//  RewardData.h
//  Club
//
//  Created by dongway on 14-9-2.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "JSONModel.h"

@protocol Newlucky <NSObject>
@end
@interface Newlucky : JSONModel
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *amount_red;
@end

@interface NewluckyInfo : JSONModel
@property(nonatomic,strong)NSArray<Newlucky>* lucky;
@end

@interface NewluckyData : JSONModel
@property(nonatomic,strong)NewluckyInfo* info;
@property(nonatomic,assign)NSInteger status;
@end
