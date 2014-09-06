//
//  BuyService.h
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BuyViewController;
@interface BuyService : NSObject

@property(nonatomic,strong)NSDictionary *firstLevelData;
-(void)goodsBySid:(NSString *)sid andGtypeid:(id)gtypeid andPage:(NSString *)page inViewController:(BuyViewController *)viewController;
-(void)refreshItemsWithObjects:(NSDictionary *)dicts andSubtypes:(NSArray *)subtypes anIndex:(NSInteger)index inViewController:(BuyViewController *)viewController;
-(void)setSelectedColorInCollectionView:(UICollectionView *)collectionView withSelectedRow:(NSInteger)row withDatas:(NSArray *)datas;
@end
