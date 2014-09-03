//
//  BuyService.m
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "BuyService.h"
#import "GoodDao.h"
#import "SVProgressHUD.h"
#import "GoodModel.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "MenuListViewController.h"
#import "MenuCollectionCell.h"

#define MainGrayColor [UIColor colorWithRed:215.0/255 green:215.0/255 blue:215.0/255 alpha:1]
@implementation BuyService

//根据以及分类，加载默认二级分类为0的数据
-(void)goodsBySid:(NSString *)sid andGtypeid:(id)gtypeid andPage:(NSString *)page inViewController:(BuyViewController *)viewController{

    if ([gtypeid isEqual:[NSNumber numberWithLong:99]]) {
        //特卖
        UserDefaults *userDefaults = [[UserDefaults alloc] init];
        UserModel *userModel = [userDefaults userModel];
        viewController.goods = userModel.goods;
        [self removeChildViewControllerInViewController:viewController];
        [viewController.tableview reloadData];
    }else{
        [SVProgressHUD showWithStatus:@"加载中......"];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            GoodDao *robdao = [[GoodDao alloc] init];
            NSDictionary *dicts = [robdao goodsBySid:sid andGtypeid:gtypeid andPage:page];
            self.firstLevelData = dicts;
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSDictionary *gtype = [self gtypeByGtypeId:gtypeid];
                NSArray *subtypes = [gtype objectForKey:@"subtype"];
                [self addMenuItemsViewControllerInViewController:viewController withSubtypes:subtypes];
                NSDictionary *subtype = [subtypes objectAtIndex:0];
                NSString *subtypeId = [subtype objectForKey:@"id"];
                NSArray *goods;
                if (dicts==nil||dicts==NULL||[dicts isEqual:[NSNull null]]) {
                    goods = nil;
                    [SVProgressHUD showErrorWithStatus:@"没有数据了"];
                }else{
                    goods = [dicts objectForKey:subtypeId];
                    [SVProgressHUD dismiss];
                }
                viewController.goods = goods;
                [viewController.tableview reloadData];
            });
        });
    }
}

//二级分类数据切换
-(void)refreshItemsWithObjects:(NSDictionary *)dicts andSubtypes:(NSArray *)subtypes anIndex:(NSInteger)index inViewController:(BuyViewController *)viewController{
    NSDictionary *subtype = [subtypes objectAtIndex:index];
    NSString *subtypeId = [subtype objectForKey:@"id"];
    viewController.goods = [dicts objectForKey:subtypeId];
    [viewController.tableview reloadData];
}

-(NSDictionary *)gtypeByGtypeId:(NSString *)gtypeid{
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSArray *gtypes = userModel.gtype;
    
    NSInteger count = gtypes.count;
    NSDictionary *gtype = nil;
    for (NSInteger i =1; i<count; i++) {
        NSDictionary *dict = [gtypes objectAtIndex:i];
        if ([gtypeid isEqual:[dict objectForKey:@"id"]]) {
            gtype = dict;
            break;
        }
    }
    return gtype;
}

-(void)removeChildViewControllerInViewController:(BuyViewController<MenuItemsCollectionControllerDelegate>*)viewController{
    [self addMenuItemsViewControllerInViewController:viewController withSubtypes:nil];
}

-(void)addMenuItemsViewControllerInViewController:(BuyViewController<MenuItemsCollectionControllerDelegate>*)viewController withSubtypes:(NSArray *)subtypes{
    MenuListViewController *menuItemsViewController = viewController.childViewControllers.firstObject;

    if (subtypes==nil&&menuItemsViewController!=nil&&[menuItemsViewController isKindOfClass:[MenuListViewController class]]){
        [menuItemsViewController.view removeFromSuperview];
        [menuItemsViewController removeFromParentViewController];
        viewController.tableview.frame  = CGRectMake(0, 95, DeviceFrame.size.width, DeviceFrame.size.height-95);
    }else if(subtypes!=nil){
        if (menuItemsViewController==nil) {
            menuItemsViewController = [[MenuListViewController alloc] initWithNibName:@"MenuListViewController" bundle:nil];
            [viewController addChildViewController:menuItemsViewController];
            [viewController.view addSubview:menuItemsViewController.view];
            CGRect rect = CGRectMake(0, 95, DeviceFrame.size.width, 27);
            menuItemsViewController.view.frame = rect;
            menuItemsViewController.collectionview.frame = rect;
            menuItemsViewController.collectionview.backgroundColor = [UIColor clearColor];
            menuItemsViewController.view.backgroundColor = MainGrayColor;
            viewController.tableview.translatesAutoresizingMaskIntoConstraints = YES;
            rect.origin.y = rect.origin.y+rect.size.height;
            rect.size.height = DeviceFrame.size.height-rect.origin.y;
            viewController.tableview.frame = rect;
        }else if(menuItemsViewController!=nil&&[menuItemsViewController isKindOfClass:[MenuListViewController class]]){
        
        }
        menuItemsViewController.menuItems = subtypes;
        menuItemsViewController.delegate = viewController;
        [menuItemsViewController.collectionview reloadData];
    }

}


-(void)setSelectedColorInCollectionView:(UICollectionView *)collectionView withSelectedRow:(NSInteger)row withDatas:(NSArray *)datas{
    NSInteger count = datas.count;
    for (NSInteger i=0; i<count; i++) {
        NSIndexPath *indpath = [NSIndexPath indexPathForRow:i inSection:0];
        MenuCollectionCell *cell = (MenuCollectionCell *)[collectionView cellForItemAtIndexPath:indpath];
        if (i==row) {
            cell.titleLabel.textColor = MainGreenColor;
        }else{
            cell.titleLabel.textColor = [UIColor blackColor];
        }
    }
}

@end
