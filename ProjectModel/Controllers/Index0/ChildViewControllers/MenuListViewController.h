//
//  MenuListViewController.h
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuItemsCollectionControllerDelegate <NSObject>

-(void)itemSelectedActionWithIndex:(NSInteger)index withObjects:(NSArray *)subtypes;

@end

@interface MenuListViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)id<MenuItemsCollectionControllerDelegate> delegate;
@property(nonatomic,strong)NSArray *menuItems;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@end
