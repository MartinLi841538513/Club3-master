//
//  Index3Service.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index3Service.h"
#import "UserDetailViewController.h"
#import "FeedbackViewController.h"
#import "QRCodeViewController.h"
#import "MyWalletViewController.h"
#import "JSONModelLib.h"
#import "Amount.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "MyOrderViewController.h"
@implementation Index3Service

/*
    用户详情
 */
-(void)presentUserDetailViewControllerOnViewController:(UIViewController *)viewController{
    UserDetailViewController *userDetailViewController = [viewController.storyboard instantiateViewControllerWithIdentifier:@"UserDetailViewController"];
    userDetailViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:userDetailViewController animated:YES];
}

/*
    我的钱包
 */
-(void)presentMyWalletViewControllerOnViewController:(UIViewController *)viewController{
    
    MyWalletViewController *userDetailViewController = [viewController.storyboard instantiateViewControllerWithIdentifier:@"MyWalletViewController"];
    userDetailViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:userDetailViewController animated:YES];
    
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *urlString = [NSString stringWithFormat:AmountURL,userModel.mid,@"1"];
    Amount *amount = [[Amount alloc] initFromURLWithString:urlString completion:^(Amount *object,JSONModelError *error){
        NSLog(@"%@",amount);
        if (!error) {
            Info *info = object.info;
            [self setIccard:info.iccard InViewController:userDetailViewController];
            NSArray<Trade> *trades = info.trade;
            userDetailViewController.amount.text = info.amount;
            userDetailViewController.redbag.text = info.redbag;
            userDetailViewController.datas = trades;
        }
    }];
}

-(void)setIccard:(NSString *)iccard InViewController:(MyWalletViewController *)viewController{
    if ([iccard isEqualToString:@""]||iccard == nil) {
        viewController.imgView.hidden = YES;
        viewController.cardId.hidden = YES;
    }else{
        viewController.cardId.text = iccard;
    }
}

/*
 我的订单
 */
-(void)presentMyOrderViewControllerOnViewController:(UIViewController *)viewController{
    MyOrderViewController *userDetailViewController = [viewController.storyboard instantiateViewControllerWithIdentifier:@"MyOrderViewController"];
    userDetailViewController.hidesBottomBarWhenPushed = YES;
    userDetailViewController.orderType = TradeOrderType;
    [viewController.navigationController pushViewController:userDetailViewController animated:YES];

}
/*
    用户反馈
 */
-(void)presentFeedBackViewControllerOnViewController:(UIViewController *)viewController{
    FeedbackViewController *feedBackViewController = [viewController.storyboard instantiateViewControllerWithIdentifier:@"FeedbackViewController"];
    feedBackViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:feedBackViewController animated:YES];
}

/*
    我的二维码
 */
-(void)presentQRCodeViewControllerOnViewController:(UIViewController *)viewController{
    QRCodeViewController *qrCodeViewController = [viewController.storyboard instantiateViewControllerWithIdentifier:@"QRCodeViewController"];
    qrCodeViewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:qrCodeViewController animated:YES];
}

/*
    联系我们
 */
-(void)callInViewController:(Index3ViewController *)viewController{
    NSString *tel = [NSString stringWithFormat:@"tel:%@",@"4000909516"];
    UIWebView *callWebview = [[UIWebView alloc] init];
    NSURL *telURL = [NSURL URLWithString:tel];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [viewController.view addSubview:callWebview];
}


@end
