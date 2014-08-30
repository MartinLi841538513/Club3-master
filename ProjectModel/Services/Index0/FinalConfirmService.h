//
//  FinalConfirmService.h
//  Club
//
//  Created by dongway on 14-8-13.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectItemsTableViewController.h"
@class FinalConfirmViewController;
@interface FinalConfirmService : NSObject

-(void)showTimePickerViewOnView:(UIView *)superView withFrame:(CGRect)frame andDatas:(NSArray *)datas onTarget:(id<SelectedItemsTableViewControllerDelegate>)delegate withObject:(id)sender;

-(void)hideChildController:(UIViewController *)childController withObject:(id)object;

-(void)payMethod1:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController;
-(void)payMethod2:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController;
-(void)sendMethod1:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController;
-(void)sendMethod2:(UIButton *)sender inViewController:(FinalConfirmViewController *)viewController;

@end
