//
//  UserDao.m
//  Club
//
//  Created by dongway on 14-8-17.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "UserDao.h"
#import "MyMD5.h"
#import "InternetRequest.h"

@implementation UserDao

//发送验证码
-(BOOL)sendValidateCodeWithName:(NSString *)name{
    
    NSString *urlString = [NSString stringWithFormat:ValicodeURL,name];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        return YES;
    }else{
        return NO;
    }
}

//注册
-(BOOL)registerWithName:name andCode:codeNumber andPasswd:passwd andPasswordConfirm:passwdConfirm{
    NSString *password = [MyMD5 md5:passwd];
    NSString *urlString = [NSString stringWithFormat:RegisterURL,name,password,password,codeNumber];
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        return YES;
    }else{
        return NO;
    }
}

//登录
-(UserModel *)getUserWithName:(NSString *)name andPassword:(NSString *)passwd{
    
    NSString *password = [MyMD5 md5:passwd];
    NSString *urlString = [NSString stringWithFormat:LoginURL,name,password];
    return [self getUserWithUrlString:urlString];
}

//获取用户信息
-(UserModel *)getUserWithName:(NSString *)name{
    
    NSString *urlString = [NSString stringWithFormat:UserinfosURL,name];
    return [self getUserWithUrlString:urlString];
}

-(UserModel *)getUserWithUrlString:(NSString *)urlString{
    NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
    UserModel *model = [[UserModel alloc] init];
    NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
    if ([status isEqual:[NSNumber numberWithInt:2]]) {
        NSDictionary *dict = [result objectForKey:@"info"];
        model = [self modelWithDict:dict];
        return model;
    }else{
        return nil;
    }
}

-(UserModel *)modelWithDict:(NSDictionary *)dict{
    UserModel *model = [[UserModel alloc] init];
    model.rotary = [dict valueForKey:@"rotary"];
    model.mobile = [dict valueForKey:@"mobile"];
    model.mid = [dict valueForKey:@"mid"];
    if ([[dict valueForKey:@"gtype"] isKindOfClass:[NSString class]]) {
        model.gtype = nil;
    }else{
        model.gtype = [dict valueForKey:@"gtype"];
    }
    model.prize = [dict valueForKey:@"prize"];
    model.sname = [dict valueForKey:@"sname"];
    model.version = [dict valueForKey:@"version"];
    model.phone = [dict valueForKey:@"phone"];
    model.sign = [dict valueForKey:@"sign"];
    model.nums = [[dict valueForKey:@"nums"] integerValue];
    model.sid = [dict valueForKey:@"sid"];
    model.loginname = [dict valueForKey:@"loginname"];
    model.qrcode = [dict valueForKey:@"qrcode"];
    model.address = [dict valueForKey:@"address"];
    model.realname = [dict valueForKey:@"realname"];
    if ([[dict valueForKey:@"goods"] isKindOfClass:[NSString class]]) {
        model.goods = [[NSArray alloc] initWithObjects: nil];
    }else{
        model.goods = [dict valueForKey:@"goods"];
    }
    model.nickname = [dict valueForKey:@"nickname"];
    model.sendtime = [dict valueForKey:@"sendtime"];
    model.picture = [dict valueForKey:@"picture"];
    model.peoples = [[dict valueForKey:@"peoples"] integerValue];
    return model;
}


@end
