//
//  ItemDetailService.h
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDetailViewController.h"
@interface ItemDetailService : NSObject

-(NSString *)reduceNumber:(UILabel *)countLabel;
-(NSString *)addNumber:(UILabel *)countLabel;

-(void)presentPurchaseCarViewControllerOnViewController:(ItemDetailViewController *)viewController withSegue:(UIStoryboardSegue *)segue andItemCount:(NSString *)count;

-(void)addToPurchaseCarWithGid:(NSString *)gid andNum:(NSString *)num;
-(void)itemsInCartShowWithSegue:(UIStoryboardSegue *)segue;
@end
