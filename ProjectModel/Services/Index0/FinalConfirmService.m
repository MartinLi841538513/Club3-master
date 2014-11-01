//
//  FinalConfirmService.m
//  Club
//
//  Created by dongway on 14-8-13.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "FinalConfirmService.h"
#import "FinalConfirmViewController.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "GoodForSubmit.h"
#import "MyMD5.h"
#import "JSONModelLib.h"
#import "Status.h"
#import "SVProgressHUD.h"
#import "NSString+MT.h"
@implementation FinalConfirmService

//显示pickerview
-(void)showTimePickerViewOnView:(UIView *)superView withFrame:(CGRect)frame andDatas:(NSArray *)datas onTarget:(id<SelectedItemsTableViewControllerDelegate>)delegate withObject:(id)sender{
    FinalConfirmViewController *selfController = (FinalConfirmViewController *)delegate;
    UIButton *button = (UIButton *)sender;
    SelectItemsTableViewController *viewController = [[SelectItemsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    viewController.view.frame = frame;
    viewController.datas = datas;
    viewController.delegate = selfController;
    [selfController addChildViewController:viewController];
    [superView addSubview:viewController.view];
    button.enabled = NO;
    float height = 172;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = viewController.view.frame;
        if (frame.size.height<132) {
            frame = CGRectMake(frame.origin.x, frame.origin.y-height, frame.size.width, frame.size.height+height);
            viewController.view.frame = frame;
        }
    }];
}

//隐藏pickerview
-(void)hideChildController:(UIViewController *)childController withObject:(id)object{
    float height = -172;
    UIButton *button = (UIButton *)object;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = childController.view.frame;
        frame = CGRectMake(frame.origin.x, frame.origin.y-height, frame.size.width, frame.size.height+height);
        childController.view.frame = frame;
    } completion:^(BOOL finished){
        [childController removeFromParentViewController];
        button.enabled = YES;
    }];
}

-(void)payMethod1:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController{
    viewController.payMethod1.tag = 1;
    viewController.payMethod2.tag = -1;
    [viewController.payMethod1 setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
    [viewController.payMethod2 setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];

}

-(void)payMethod2:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController{
    viewController.payMethod1.tag = -1;
    viewController.payMethod2.tag = 1;
    [viewController.payMethod1 setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
    [viewController.payMethod2 setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
    
}

-(void)sendMethod1:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController{
    viewController.sendMethod1.tag = 1;
    viewController.sendMethod2.tag = -1;
    [viewController.sendMethod1 setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
    [viewController.sendMethod2 setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
    
}

-(void)sendMethod2:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController{
    viewController.sendMethod1.tag = -1;
    viewController.sendMethod2.tag = 1;
    [viewController.sendMethod1 setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
    [viewController.sendMethod2 setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];

}
-(void)submitActionInViewController:(FinalConfirmViewController *)viewController{
    
    if([self compareCurrentTimeWithTime:@"21:00:00"] == NSOrderedDescending && [self compareCurrentTimeWithTime:@"06:00:00"] == NSOrderedAscending){
        //如果是卖家送货
        if (viewController.sendMethod2.tag==1) {
            if ([viewController.sendAddress.text isEqualToString:@""]) {
                [SVProgressHUD showErrorWithStatus:@"请填写准确送货地址"];
                return;
            }else if(![viewController.userPhone.text isValidateMobile:viewController.userPhone.text]){
                [SVProgressHUD showErrorWithStatus:@"请正确填写手机号码"];
                return;
            }
        }
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"支付密码" message:@"支付密码为登陆密码" delegate:viewController cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
        [alertView show];

    }else{
        [SVProgressHUD showErrorWithStatus:@"下单时间:每天6:00-21:00"];
    }
}

//比较时间，timeString格式为HH:mm:ss
-(NSComparisonResult)compareCurrentTimeWithTime:(NSString *)timeString{
    NSDate *currenTime = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentTimeString = [formatter stringFromDate:currenTime];
    timeString = [currentTimeString stringByReplacingCharactersInRange:NSMakeRange(11, 8) withString:timeString];
    NSDate *time = [formatter dateFromString:timeString];
    return [time compare:currenTime];
}

-(void)submitInViewController:(FinalConfirmViewController *)viewController withPassword:(NSString *)password{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSString *datas = [NSString stringWithFormat:@"%@",[self finalItemsWithObjects:viewController.items]];
    NSString *payType = [self payTypeInViewController:viewController];
    NSString *sendType = [self sendTypeInViewController:viewController];
    NSString *Sendid = viewController.sendTime.titleLabel.text;
    NSString *address = viewController.sendAddress.text;
    NSString *mobile = viewController.userPhone.text;
    NSString *message = viewController.userMessage.text;
    NSString *passwd = [MyMD5 md5:password];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:mid, @"mid",datas,@"info",payType,@"paymenttype",sendType,@"sendtype",Sendid,@"Sendid",passwd,@"paypassword",address,@"address",mobile,@"mobile",message,@"message",nil];
    NSLog(@"%@   %@",SubmitItemsURL,dict);
    [SVProgressHUD show];
    [JSONHTTPClient postJSONFromURLWithString:SubmitItemsURL params:dict completion:^(id object, JSONModelError *err) {
        
        NSNumber *status = (NSNumber *)[object objectForKey:@"status"];
       if ([status isEqual:[NSNumber numberWithInt: 2]]) {
           [SVProgressHUD showSuccessWithStatus:@"支付成功"];
       }else if([status isEqual:[NSNumber numberWithInt: 830]]){
           [SVProgressHUD showErrorWithStatus:@"支付密码错误"];
       }else if ([status isEqual:[NSNumber numberWithInt: 850]]){
           [SVProgressHUD dismiss];
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"无会员卡" message:@"请到小区所在生活馆购买会员卡" delegate:viewController cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
           [alertView show];
       }else if ([status isEqual:[NSNumber numberWithInt:820]]){
           [SVProgressHUD showErrorWithStatus:@"商品不存在"];
       } else{
           [SVProgressHUD showErrorWithStatus:@"提交失败"];
           NSLog(@"%@",err);
       }
    }];
}

//-(NSArray *)finalItemsWithObjects:(NSArray *)datas{
//    NSMutableArray *items = [[NSMutableArray alloc] init];
//    NSInteger count = datas.count;
//    for (NSInteger i=0; i<count; i++) {
//        GoodForSubmit *good = [datas objectAtIndex:i];
//        NSDictionary *item = [[NSDictionary alloc] initWithObjectsAndKeys:good.cid,@"cid",good.gid,@"gid",good.num,@"num",good.total, @"total",nil];
//        [items addObject:item];
//    }
//    return (NSArray *)items;
//}

-(NSString *)finalItemsWithObjects:(NSArray *)datas{
    NSMutableString *items = [[NSMutableString alloc] init];
    NSInteger count = datas.count;
    for (NSInteger i=0; i<count; i++) {
        GoodForSubmit *good = [datas objectAtIndex:i];
        if (i==count-1) {
            [items appendString:[NSString stringWithFormat:@"%@:%@",good.gid,good.num]];
        }else{
            [items appendString:[NSString stringWithFormat:@"%@:%@,",good.gid,good.num]];
        }
    }
    return items;
}

-(NSString *)payTypeInViewController:(FinalConfirmViewController *)viewController{
    NSString *payType;
    if (viewController.payMethod1.tag==1) {
        payType = @"2";
    }else if(viewController.payMethod2.tag==2){
        payType = @"1";
    }
    return payType;
}

//送货方式
-(NSString *)sendTypeInViewController:(FinalConfirmViewController *)viewController{
    NSString *sendType;
    if (viewController.sendMethod1.tag==1) {
        sendType=@"1";
    }else if(viewController.sendMethod2.tag==1){
        sendType = @"2";
    }
    return sendType;
}



@end



