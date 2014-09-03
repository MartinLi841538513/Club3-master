//
//  FeedbackService.m
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "FeedbackService.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "SVProgressHUD.h"
#import "Status.h"
#import "JSONModelLib.h"
@implementation FeedbackService
-(void)submitWithContent:(NSString *)content{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = userDefaults.userModel;
    NSString *mid = userModel.mid;
    NSString *urlString = [NSString stringWithFormat:FeedBackURL,mid,content];
    if (content==nil||content.length<5) {
        [SVProgressHUD showErrorWithStatus:@"字数不够"];
        return;
    }
    [SVProgressHUD show];
    Status *status = [[Status alloc] initFromURLWithString:urlString completion:^(Status *object,JSONModelError *error){
        NSLog(@"%@",status);
        if (!error) {
            if (object.status==2) {
                [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            }else{
                [SVProgressHUD showErrorWithStatus:@"提交失败"];
            }
        }else{
            NSLog(@"%@",error);
        }
    }];
}
@end
