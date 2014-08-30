//
//  UserModel.h
//  Club
//
//  Created by dongway on 14-8-17.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (retain, nonatomic) NSArray *rotary;
@property (copy, nonatomic) NSString *mobile;
@property (copy, nonatomic) NSString *mid;
@property (retain, nonatomic) NSArray *gtype;
@property (retain, nonatomic) NSArray *prize;
@property (copy, nonatomic) NSString *sname;
@property (copy, nonatomic) NSString *version;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *sign;
@property (assign, nonatomic) long nums;
@property (copy, nonatomic) NSString *sid;
@property (copy, nonatomic) NSString *loginname;
@property (copy, nonatomic) NSString *qrcode;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *realname;
@property (retain, nonatomic) NSArray *goods;
@property (copy, nonatomic) NSString *nickname;
@property (copy, nonatomic) NSString *sendtime;
@property (copy, nonatomic) NSString *picture;
@property (assign, nonatomic) long peoples;

@end
