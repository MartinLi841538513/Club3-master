//
//  NSString+MT.m
//  Club
//
//  Created by dongway on 14-8-20.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "NSString+MT.h"

@implementation NSString (MT)

//时间戳转时间yyyy-MM-dd HH:MM:ss格式
-(NSString *)timeType1FromStamp:(NSString *)stamp{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    return [self timeFromStamp:stamp withFormatter:formatter];
}

//时间戳转时间HH:MM格式
-(NSString *)timeType2FromStamp:(NSString *)stamp{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:MM"];
    return [self timeFromStamp:stamp withFormatter:formatter];
}

-(NSString *)timeFromStamp:(NSString *)stamp withFormatter:(NSDateFormatter *)formatter{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[stamp doubleValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

@end
