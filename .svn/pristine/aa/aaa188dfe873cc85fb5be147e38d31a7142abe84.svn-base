//
//  InternetRequest.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "InternetRequest.h"
#import "SVProgressHUD.h"

@implementation InternetRequest

+(void)dispatch_aync_LoadDataWithUrlString:(NSString *)urlString complite:(void(^)(id dict))compliteAction{
    
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //InteractWithServerOnJSON interactWithServerOnJSON 这是我自己封装的加载json数据的方法
        NSDictionary *result = [self loadDataWithUrlString:urlString];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:@"成功"];
            return compliteAction(result);
        });
    });
}

+(NSDictionary *)loadDataWithUrlString:(NSString *)urlString
{
    NSError *error;
    NSString *urlStringEncoding = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",urlStringEncoding);
    
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStringEncoding]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (response != nil && error == nil) {
        return [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    } else {
        return  nil;
    }
}

@end
