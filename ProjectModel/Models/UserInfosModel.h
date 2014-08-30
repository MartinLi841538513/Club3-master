//
//  Model.h
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfosModel : NSObject
@property (copy, nonatomic) NSString *ICCID;
@property (copy, nonatomic) NSString *passWord;
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *createTime;
@property (copy, nonatomic) NSString *telephone;
@property (copy, nonatomic) NSString *userPoint;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *IMEI;
@property (copy, nonatomic) NSString *invitation_code;
@property (copy, nonatomic) NSString *invitation_link;
@property (copy, nonatomic) NSString *is_verified;
@property (copy, nonatomic) NSString *cardID;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *userTitle;
@property (copy, nonatomic) NSString *is_vip;
@property (copy, nonatomic) NSString *IMSI;
@end
