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
            [SVProgressHUD dismiss];
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

+(id)postUrlString:(NSString *)urlString withDict:(NSDictionary *)dict{

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSMutableString *body = [[NSMutableString alloc] init];
    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
    NSArray *keys = dict.allKeys;
    for(NSString *key in keys){
        [body appendString:[NSString stringWithFormat:@"&%@=%@",key,[dict objectForKey:key]]];
    }
    NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //第三步，连接服务器
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    return [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
}


//请求一张image
+(id)postUrlString:(NSString *)urlString withDict:(NSDictionary *)dict andImagePath:(NSString *)imagePath andImageName:(NSString *)imageName{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSMutableString *content = [[NSMutableString alloc] init];
    NSArray *keys = dict.allKeys;
    for(NSString *key in keys){
        [content appendString:[NSString stringWithFormat:@"&%@=%@",key,[dict objectForKey:key]]];
    }
    NSMutableData *body = [[NSMutableData alloc] init];
    
    //image
    UIImage *image = [UIImage imageNamed:imageName];
    NSData *imageData;

    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(image)) {
        //返回为png图像。
        imageData = UIImagePNGRepresentation(image);
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(image, 1.0);
    }
    [content appendFormat:@"Content-Type: image/jpge,image/gif, image/jpeg, image/pjpeg, image/pjpeg\r\n\r\n"];
    [content appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",imageName,imageName];
    
    [body appendData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:imageData];
    [request setValue:@"multipart/form-data;" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
    [request setHTTPBody:body];
    //第三步，连接服务器
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    return [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
    return nil;
}

@end
