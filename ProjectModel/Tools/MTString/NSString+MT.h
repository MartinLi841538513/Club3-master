//
//  NSString+MT.h
//  Club
//
//  Created by dongway on 14-8-20.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MT)
-(NSString *)timeType1FromStamp:(NSString *)stamp;
-(NSString *)timeType2FromStamp:(NSString *)stamp;
-(NSString *)timeType3FromStamp:(NSString *)stamp;
-(NSComparisonResult)compareCurrentTimeWith:(NSString *)stamp;
-(BOOL) isValidateMobile:(NSString *)mobile;
@end
