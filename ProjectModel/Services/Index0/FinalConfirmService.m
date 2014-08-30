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

-(void)submitInViewController:(FinalConfirmViewController *)viewController{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    NSArray *items = [self finalItemsWithObjects:viewController.items];
    NSString *sendType = [self sendTypeInViewController:viewController];
    
}

-(NSArray *)finalItemsWithObjects:(NSArray *)datas{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    NSInteger count = datas.count;
    for (NSInteger i=0; i<count; i++) {
        GoodForSubmit *good = [datas objectAtIndex:i];
        NSDictionary *item = [[NSDictionary alloc] initWithObjectsAndKeys:@"cid",good.cid,@"gid",good.gid,@"num",good.num,@"total",good.total, nil];
        [items addObject:item];
    }
    return (NSArray *)items;
}

-(NSString *)payTypeInViewController:(FinalConfirmViewController *)viewController{
    NSString *payType;
    if (viewController.payMethod1.tag==1) {
        payType = @"1";
    }else if(viewController.payMethod2.tag==2){
        payType = @"1";
    }
    return payType;
}

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



