//
//  UserModel.m
//  Club
//
//  Created by dongway on 14-8-17.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.rotary forKey:@"rotary"];
    [encoder encodeObject:self.mobile forKey:@"mobile"];
    [encoder encodeObject:self.mid forKey:@"mid"];
    [encoder encodeObject:self.gtype forKey:@"gtype"];
    [encoder encodeObject:self.prize forKey:@"prize"];
    [encoder encodeObject:self.sname forKey:@"sname"];
    [encoder encodeObject:self.version forKey:@"version"];
    [encoder encodeObject:self.phone forKey:@"phone"];
    [encoder encodeObject:self.sign forKey:@"sign"];
    [encoder encodeObject:[NSString stringWithFormat:@"%ld",(long)self.nums] forKey:@"nums"];
    [encoder encodeObject:self.sid forKey:@"sid"];
    [encoder encodeObject:self.loginname forKey:@"loginname"];
    [encoder encodeObject:self.qrcode forKey:@"qrcode"];
    [encoder encodeObject:self.address forKey:@"address"];
    [encoder encodeObject:self.realname forKey:@"realname"];
    [encoder encodeObject:self.goods forKey:@"goods"];
    [encoder encodeObject:self.nickname forKey:@"nickname"];
    [encoder encodeObject:self.sendtime forKey:@"sendtime"];
    [encoder encodeObject:self.picture forKey:@"picture"];
    [encoder encodeObject:[NSString stringWithFormat:@"%ld",(long)self.peoples] forKey:@"peoples"];
}


- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.rotary = [decoder decodeObjectForKey:@"rotary"];
        self.mobile = [decoder decodeObjectForKey:@"mobile"];
        self.mid = [decoder decodeObjectForKey:@"mid"];
        self.gtype = [decoder decodeObjectForKey:@"gtype"];
        self.prize = [decoder decodeObjectForKey:@"prize"];
        self.sname = [decoder decodeObjectForKey:@"sname"];
        self.version = [decoder decodeObjectForKey:@"version"];
        self.phone = [decoder decodeObjectForKey:@"phone"];
        self.sign = [decoder decodeObjectForKey:@"sign"];
        self.nums = [[decoder decodeObjectForKey:@"nums"] integerValue];
        self.sid = [decoder decodeObjectForKey:@"sid"];
        self.loginname = [decoder decodeObjectForKey:@"loginname"];
        self.qrcode = [decoder decodeObjectForKey:@"qrcode"];
        self.address = [decoder decodeObjectForKey:@"address"];
        self.realname = [decoder decodeObjectForKey:@"realname"];
        self.goods = [decoder decodeObjectForKey:@"goods"];
        self.nickname = [decoder decodeObjectForKey:@"nickname"];
        self.sendtime = [decoder decodeObjectForKey:@"sendtime"];
        self.picture = [decoder decodeObjectForKey:@"picture"];
        self.peoples = [[decoder decodeObjectForKey:@"peoples"] integerValue];
    }
    return self;
}

@end
