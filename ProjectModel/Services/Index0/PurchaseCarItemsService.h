//
//  PurchaseCarItemsService.h
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PurchaseCarItemsViewController.h"
#import "PurchaseCarItemCell.h"

@interface PurchaseCarItemsService : NSObject

-(NSMutableArray<GoodForSubmit>*)goodsForSubmitByItems:(NSMutableArray<Good>*)items;

-(NSString *)reduceNumber:(UILabel *)countLabel;
-(NSString *)addNumber:(UILabel *)countLabel;

-(void)addInViewController:(PurchaseCarItemsViewController *)viewController atCell:(PurchaseCarItemCell *)cell andRow:(NSInteger)row;
-(void)reduceInViewController:(PurchaseCarItemsViewController *)viewController atCell:(PurchaseCarItemCell *)cell andRow:(NSInteger)row;
-(void)presentFinalConfirmViewControllerOnViewController:(UIViewController *)viewController;
-(float)totalPriceByitems:(NSArray *)items;
-(float)totalPriceDatas:(NSArray *)datas;
-(void)deleteItemByGid:(NSString *)gid inPurchaseViewController:(PurchaseCarItemsViewController *)viewController atIndexPath:(NSIndexPath *)indexPath;
-(void)checkActionInViewController:(PurchaseCarItemsViewController *)viewController atCell:(PurchaseCarItemCell *)cell andRow:(NSInteger)row withDatas:(NSMutableArray *)datas;
-(void)selectAllButton:(UIButton *)button InViewController:(PurchaseCarItemsViewController *)viewController;
-(void)pushToFinamConfirmViewControllerWithSegue:(UIStoryboardSegue *)segue fromViewController:(PurchaseCarItemsViewController *)cartViewController;
@end
