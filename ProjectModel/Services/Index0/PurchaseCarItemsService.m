//
//  PurchaseCarItemsService.m
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PurchaseCarItemsService.h"
#import "FinalConfirmViewController.h"
#import "Good.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "SVProgressHUD.h"
#import "GoodDao.h"
#import "GoodForSubmit.h"
@implementation PurchaseCarItemsService


/*
 数量减1
 */
-(NSString *)reduceNumber:(UILabel *)countLabel{
    int currentCount = [countLabel.text intValue];
    if (currentCount>0) {
        currentCount--;
    }
    return [NSString stringWithFormat:@"%d",currentCount];
}
-(void)reduceInViewController:(PurchaseCarItemsViewController *)viewController atCell:(PurchaseCarItemCell *)cell andRow:(NSInteger)row{
    NSInteger num = [cell.count.text integerValue];
    if (num>1) {
        num--;
        if (cell.checkImgButton.tag>0) {
            [self setViewController:viewController andCell:cell atRow:row andNum:num andGoods:viewController.datasStorage];
        }
    }else{
        [SVProgressHUD showErrorWithStatus:@"数量最低为1"];
    }
}


/*
 数量＋1
 */
-(NSString *)addNumber:(UILabel *)countLabel{
    int currentCount = [countLabel.text intValue];
    if (currentCount<20) {
        currentCount++;
    }
    return [NSString stringWithFormat:@"%d",currentCount];
}

-(void)addInViewController:(PurchaseCarItemsViewController *)viewController atCell:(PurchaseCarItemCell *)cell andRow:(NSInteger)row{
    NSInteger num = [cell.count.text integerValue];
    num++;
    if (cell.checkImgButton.tag>0) {
        [self setViewController:viewController andCell:cell atRow:row andNum:num andGoods:viewController.datasStorage];
    }
}

-(void)setViewController:(PurchaseCarItemsViewController *)viewController andCell:(PurchaseCarItemCell *)cell atRow:(NSInteger)row andNum:(NSInteger)num andGoods:(NSMutableArray *)goods{
    GoodForSubmit *good = [goods objectAtIndex:row];
    good.num = [NSString stringWithFormat:@"%d",num];
    good.total = [NSString stringWithFormat:@"%0.1f",num*[good.discount floatValue]];
    cell.count.text = [NSString stringWithFormat:@"%d",num];
    cell.totalPrice.text = [NSString stringWithFormat:@"%0.1f",num*[good.discount floatValue]];
    viewController.totalPrice.text = [NSString stringWithFormat:@"总额:￥%0.1f",[self totalPriceDatas:goods]];
}

/*
    跳转至最后确认界面
 */
-(void)presentFinalConfirmViewControllerOnViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FinalConfirmViewController *finalViewController = [storyboard instantiateViewControllerWithIdentifier:@"FinalConfirmViewController"];
    [viewController.navigationController pushViewController:finalViewController animated:YES];
}

/*
    checkButton点击
 */
-(void)checkActionInViewController:(PurchaseCarItemsViewController *)viewController atCell:(PurchaseCarItemCell *)cell andRow:(NSInteger)row withDatas:(NSMutableArray *)datas{
    Good *good = [viewController.items objectAtIndex:row];
    GoodForSubmit *goodForSubmit = [datas objectAtIndex:row];
    good.num = cell.count.text;
    cell.checkImgButton.tag = -cell.checkImgButton.tag;
    if (cell.checkImgButton.tag>0) {
        [cell.checkImgButton setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
        goodForSubmit.isChecked = YES;
        goodForSubmit.num = cell.count.text;
        goodForSubmit.total = [NSString stringWithFormat:@"%0.1f",[cell.count.text integerValue]*[goodForSubmit.discount floatValue]];
        if ([self isSelecteAllInViewController:viewController]) {
            viewController.selectAllButton.tag = 1;
            [viewController.selectAllButton setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
        }else{
            viewController.selectAllButton.tag = -1;
            [viewController.selectAllButton setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
        }
    }else if(cell.checkImgButton.tag<0){
        goodForSubmit.isChecked = NO;
        viewController.selectAllButton.tag = -1;
        [viewController.selectAllButton setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
        [cell.checkImgButton setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
        
    }
    viewController.totalPrice.text = [NSString stringWithFormat:@"总额:￥%0.1f",[self totalPriceDatas:datas]];
}

//判断是否全选
-(BOOL)isSelecteAllInViewController:(PurchaseCarItemsViewController *)viewController{
    NSInteger count = viewController.datasStorage.count;
    for (NSInteger i=0; i<count; i++) {
        GoodForSubmit *good = [viewController.datasStorage objectAtIndex:i];
        if (good.isChecked==NO) {
            return NO;
        }
    }
    return YES;
}

/*
    计算总额
 */
-(float)totalPriceByitems:(NSArray *)items{
    NSInteger length = items.count;
    float total = 0;
    for (NSInteger i=0; i<length; i++) {
        Good *good = [items objectAtIndex:i];
        total += [good.discount floatValue]*[good.num intValue];
    }
    return total;
}

/*
    计算总额
 */
-(float)totalPriceDatas:(NSArray *)datas{
    NSInteger count = datas.count;
    float total = 0;
    for (NSInteger i=0; i<count; i++) {
        GoodForSubmit *good = [datas objectAtIndex:i];
        if (good.isChecked) {
            float price = [good.discount floatValue];
            NSInteger num = [good.num integerValue];
            total += price*num;
        }
    }
    return total;
}

/*
    从购物车删除一个物品
 */
-(void)deleteItemByGid:(NSString *)gid inPurchaseViewController:(PurchaseCarItemsViewController *)viewController atIndexPath:(NSIndexPath *)indexPath{
    [self addToPurchaseCarWithGid:gid andNum:@"-99" inPurchaseViewController:(PurchaseCarItemsViewController *)viewController atIndexPath:(NSIndexPath *)indexPath];
}

-(void)addToPurchaseCarWithGid:(NSString *)gid andNum:(NSString *)num inPurchaseViewController:(PurchaseCarItemsViewController *)viewController atIndexPath:(NSIndexPath *)indexPath{
    
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *mid = userModel.mid;
    
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        GoodDao *robdao = [[GoodDao alloc] init];
        BOOL result = [robdao addToPurchaseCarWithMid:mid andGid:gid andNum:num];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (result) {
                [SVProgressHUD showSuccessWithStatus:@"操作成功"];
                [self deleteCellInPurchaseViewController:viewController atIndexPath:indexPath];
            }else{
                [SVProgressHUD showErrorWithStatus:@"操作失败"];
            }
        });
    });
}

-(void)deleteCellInPurchaseViewController:(PurchaseCarItemsViewController *)viewController atIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    NSArray *cells = [[NSArray alloc] initWithObjects:indexPath, nil];
    [viewController.datasStorage removeObjectAtIndex:row];
    [viewController.tableview beginUpdates];
    [viewController.items removeObjectAtIndex:row];
    [viewController.tableview deleteRowsAtIndexPaths:cells withRowAnimation: UITableViewRowAnimationLeft];
    [viewController.tableview endUpdates];
    [viewController.tableview reloadData];
    viewController.totalPrice.text = [NSString stringWithFormat:@"总额:￥%0.1f",[self totalPriceDatas:viewController.datasStorage]];
    if ([self isSelecteAllInViewController:viewController]) {
        viewController.selectAllButton.tag = 1;
        [viewController.selectAllButton setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
    }
}

/*
    选择或取消所有
 */
-(void)selectAllButton:(UIButton *)button InViewController:(PurchaseCarItemsViewController *)viewController{
    
    button.tag = -button.tag;
    if (button.tag==1) {
        //选择所有
        [button setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
    }else if(button.tag==-1){
        //取消全部选择
        [button setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
    }
    [self setSelectedAllInViewController:viewController withStatus:button.tag];
}

-(void)setSelectedAllInViewController:(PurchaseCarItemsViewController *)viewController withStatus:(NSInteger)status{
    NSArray *goods = viewController.items;
    NSInteger count = goods.count;
    for (NSInteger i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        PurchaseCarItemCell *cell = (PurchaseCarItemCell *)[viewController.tableview cellForRowAtIndexPath:indexPath];
        cell.checkImgButton.tag = abs(cell.checkImgButton.tag)*status;
        GoodForSubmit *goodForSubmit = [viewController.datasStorage objectAtIndex:i];
        if (status>0) {
            [cell.checkImgButton setImage:[UIImage imageNamed:@"checked_true"] forState:UIControlStateNormal];
            goodForSubmit.isChecked = YES;
            goodForSubmit.num = cell.count.text;
            goodForSubmit.total = [NSString stringWithFormat:@"%0.1f",[cell.count.text integerValue]*[goodForSubmit.discount floatValue]];
        }else{
            [cell.checkImgButton setImage:[UIImage imageNamed:@"checked_false"] forState:UIControlStateNormal];
            goodForSubmit.isChecked = NO;
        }
    }
    viewController.totalPrice.text = [NSString stringWithFormat:@"总额:￥%0.1f",[self totalPriceDatas:viewController.datasStorage]];
}

/*
    提交
 */
-(void)pushToFinamConfirmViewControllerWithSegue:(UIStoryboardSegue *)segue fromViewController:(PurchaseCarItemsViewController *)cartViewController{
    FinalConfirmViewController *viewController = (FinalConfirmViewController *)segue.destinationViewController;
    viewController.items = [self goodsForPassInGoodsForSubmit:cartViewController.datasStorage];
    viewController.redAccount = cartViewController.cartInfo.redbag;
    viewController.account = cartViewController.cartInfo.amount;
    viewController.totalPriceString = [NSString stringWithFormat:@"%0.1f", [self totalPriceDatas:cartViewController.datasStorage]];
}

-(NSArray *)selectedItemsInViewController:(PurchaseCarItemsViewController *)viewController{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    NSArray *goods = viewController.items;
    NSInteger count = goods.count;
    for (NSInteger i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        PurchaseCarItemCell *cell = (PurchaseCarItemCell *)[viewController.tableview cellForRowAtIndexPath:indexPath];
        if (cell.checkImgButton.tag>0) {
            Good *good = [goods objectAtIndex:i];
            good.num = cell.count.text;
            [items addObject:good];
        }
    }
    return (NSArray *)items;
}

-(NSMutableArray *)removeObject:(Good *)good inDatas:(NSMutableArray *)datas{
    NSInteger count = datas.count;
    for (NSInteger i=0; i<count; i++) {
        Good *data = [datas objectAtIndex:i];
        if (good.gid==data.gid) {
            [datas removeObjectAtIndex:i];
            return datas;
        }
    }
    return datas;
}

-(NSMutableArray<GoodForSubmit>*)goodsForSubmitByItems:(NSMutableArray<Good>*)items{
    NSInteger count = items.count;
    NSMutableArray *goods = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<count; i++) {
        Good *good = [items objectAtIndex:i];
        GoodForSubmit *goodForSubmit = [[GoodForSubmit alloc] init];
        goodForSubmit.cid = good.cid;
        goodForSubmit.gid = good.gid;
        goodForSubmit.name = good.name;
        goodForSubmit.num = good.num;
        goodForSubmit.unit = good.unit;
        goodForSubmit.discount = good.discount;
        goodForSubmit.total = [NSString stringWithFormat:@"%0.1f",[good.discount floatValue]*[good.num integerValue]];
        goodForSubmit.isChecked = YES;
        [goods addObject:goodForSubmit];
    }
    return (NSMutableArray<GoodForSubmit>*)goods;
}

-(NSMutableArray<GoodForSubmit>*)goodsForPassInGoodsForSubmit:(NSMutableArray<GoodForSubmit> *)goodsForSubmit{
    NSInteger count = [goodsForSubmit count];
    NSMutableArray *goods = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<count; i++) {
        GoodForSubmit *good = [goodsForSubmit objectAtIndex:i];
        if (good.isChecked) {
            [goods addObject:good];
        }
    }
    return (NSMutableArray<GoodForSubmit>*)goods;
}
@end
