//
//  BuyViewController.m
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "BuyViewController.h"
#import "MenuCollectionCell.h"
#import "ItemDetailViewController.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "GoodModel.h"
#import <UIImageView+WebCache.h>
#import "GoodDao.h"
#import "BuyService.h"
#import "MenuCollectionCell.h"
#import "ItemDetailService.h"
#import "MJRefresh.h"
@interface BuyViewController ()
{
    UICollectionView *collectionview;
    
    NSString *collectionviewCellIdentifier;
    NSString *tableviewCellIdentifier;
    UIColor *color;//黑色
    UIColor *color1;//主灰色
    UIColor *color2;//主绿色
    NSArray *menuItems;
    UserModel *userModel;
    
    BuyService *buyService;
    NSInteger page;
}

@end

@implementation BuyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    [super loadView];
    color = [UIColor blackColor];
    color1 = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1];
    color2 = [UIColor colorWithRed:74/255.0 green:205/255.0 blue:139/255.0 alpha:1];
    
    self.title = @"厂家直销";
    
    collectionview = [self collectionview];
    [self.view addSubview:collectionview];
    
    UIView *separateLine = [[UIView alloc] initWithFrame:CGRectMake(0, collectionview.frame.origin.y+collectionview.frame.size.height, 320, 1)];
    separateLine.backgroundColor = color1;
    [self.view addSubview:separateLine];
    
    self.tableview = [self setSelfTableview:self.tableview];
    [self.view addSubview:self.tableview];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    userModel = [userDefaults userModel];
    menuItems = userModel.gtype;
    page = 1;
    self.goods = [NSMutableArray arrayWithArray:userModel.goods];
    
    buyService = [[BuyService alloc] init];
//    [self setupRefresh];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"purchaseCart"]) {
        ItemDetailService *itemDetailService = [[ItemDetailService alloc] init];
        [itemDetailService itemsInCartShowWithSegue:segue];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///**
// *  集成刷新控件
// */
//- (void)setupRefresh
//{
//    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
//    [self.tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
//    [self.tableview headerBeginRefreshing];
//    
//    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
//    [self.tableview addFooterWithTarget:self action:@selector(footerRereshing)];
//    
//    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
//    self.tableview.headerPullToRefreshText = @"下拉可以刷新了";
//    self.tableview.headerReleaseToRefreshText = @"松开马上刷新了";
//    self.tableview.headerRefreshingText = @"正在帮你刷新中";
//    
//    self.tableview.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    self.tableview.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    self.tableview.footerRefreshingText = @"正在帮你加载中";
//}
//
//#pragma mark 开始进入刷新状态
//- (void)headerRereshing
//{
//    page = 1;
//    NSString *pageString = [NSString stringWithFormat:@"%ld",(long)page];
//    NSString *urlString = [NSString stringWithFormat:@"http://earea.stcyclub.com/wap.php/Prize/mylucky?mid=%@&page=%@",@"38",pageString];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
//            if ([status isEqual:[NSNumber numberWithInt:2]]) {
//                [datas removeAllObjects];
//                id infos = [result objectForKey:@"info"];
//                if ([infos isKindOfClass:[NSArray class]]) {
//                    [datas addObjectsFromArray:infos];
//                }
//                [self.tableview reloadData];
//                [self.tableview headerEndRefreshing];
//            }else{
//                [SVProgressHUD showErrorWithStatus:@"没有数据"];
//                [self.tableview headerEndRefreshing];
//                page = 0;
//            }
//        });
//    });
//}

//- (void)footerRereshing
//{
//    page++;
//    NSString *pageString = [NSString stringWithFormat:@"%d",page];
//    NSString *urlString = [NSString stringWithFormat:@"http://earea.stcyclub.com/wap.php/Prize/mylucky?mid=%@&page=%@",@"38",pageString];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSNumber *status = (NSNumber *)[result objectForKey:@"status"];
//            if ([status isEqual:[NSNumber numberWithInt:2]]) {
//                id infos = [result objectForKey:@"info"];
//                if ([infos isKindOfClass:[NSArray class]]) {
//                    [datas addObjectsFromArray:infos];
//                    [self.tableview reloadData];
//                }else{
//                    [SVProgressHUD showErrorWithStatus:@"没有更多数据了"];
//                }
//                [self.tableview footerEndRefreshing];
//            }else{
//                [SVProgressHUD showErrorWithStatus:@"没有更多数据了"];
//                [self.tableview footerEndRefreshing];
//                page--;
//            }
//        });
//    });
//    
//}


//初始化UIcollectionview
-(UICollectionView *)collectionview{
    collectionviewCellIdentifier = @"MenuCollectionCell";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, ItemHeight) collectionViewLayout: layout];
    [collectionview setShowsHorizontalScrollIndicator:NO];
    [collectionview registerClass:[MenuCollectionCell class] forCellWithReuseIdentifier: @"MenuCollectionCell"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;//解决cellForItemAtIndexPath not called问题
    
    UINib *nib = [UINib nibWithNibName:@"MenuCollectionCell" bundle:nil];
    [collectionview registerNib:nib forCellWithReuseIdentifier:collectionviewCellIdentifier];
    collectionview.delegate = self;
    collectionview.dataSource = self;
    collectionview.backgroundColor = [UIColor whiteColor];
    return collectionview;
}

//初始化UITableview
-(UITableView *)setSelfTableview:(UITableView *)tableview{
    tableviewCellIdentifier = @"ItemCell";
    CGRect frame = collectionview.frame;
    float originY = frame.origin.y+frame.size.height+8;
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, originY, DeviceFrame.size.width, DeviceFrame.size.height-originY)];
    UINib *nib = [UINib nibWithNibName:@"ItemCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:tableviewCellIdentifier];
    tableview.delegate = self;
    tableview.dataSource = self;
    return tableview;
}

#pragma mark --UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return menuItems.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    MenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionviewCellIdentifier forIndexPath:indexPath];
    NSDictionary *gtype = [menuItems objectAtIndex:row];
    cell.titleLabel.text = [gtype objectForKey:@"name"];
    if (row==0) {
        cell.titleLabel.textColor = MainGreenColor;
    }
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(70, 37);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row= indexPath.row;
    NSDictionary *gtype = [menuItems objectAtIndex:row];
    id gtypeId;
    if (row==0) {
        gtypeId = [gtype objectForKey:@"gtypeid"];
    }else{
        gtypeId = [gtype objectForKey:@"id"];
    }

    [buyService setSelectedColorInCollectionView:collectionView withSelectedRow:row withDatas:menuItems];
    [buyService goodsBySid:userModel.sid andGtypeid:gtypeId andPage:@"1" inViewController:self];
    NSLog(@"didSelect:%@",gtypeId);
}



- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuCollectionCell *cell = (MenuCollectionCell *)[collectionview cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = color2;
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuCollectionCell *cell = (MenuCollectionCell *)[collectionview cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}


#pragma UITableviewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:tableviewCellIdentifier forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    GoodModel *goodModel = [[GoodModel alloc] init];
    GoodDao *goodDao = [[GoodDao alloc] init];
    goodModel = [goodDao modelWithDict:[self.goods objectAtIndex:row]];
    
    cell.buyButton.tag = section;
    cell.addButton.tag = section;
    cell.delegate = self;
    
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,goodModel.picture]]];
    cell.name.text = goodModel.name;
    cell.discout.text = [NSString stringWithFormat:@"%0.1f折优惠",[goodModel.discount floatValue]*10/[goodModel.price floatValue]];
    cell.pastPrice.text = [NSString stringWithFormat:@"原价：%@元/%@",goodModel.price,goodModel.unit];
    cell.currenPrice.text = [NSString stringWithFormat:@"%@元/%@",goodModel.discount,goodModel.unit];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    GoodModel *goodModel = [[GoodModel alloc] init];
    GoodDao *goodDao = [[GoodDao alloc] init];
    goodModel = [goodDao modelWithDict:[self.goods objectAtIndex:row]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.goodModel = goodModel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 93;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}


#pragma MenuItemsCollectionControllerDelegate
-(void)itemSelectedActionWithIndex:(NSInteger)index withObjects:(NSArray *)subtypes{
    NSLog(@"test:%ld  %@",(long)index,subtypes);
    [buyService refreshItemsWithObjects:buyService.firstLevelData andSubtypes:subtypes anIndex:index inViewController:self];
}
//立即购买
-(void)buyAction:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSLog(@"buy:%ld",(long)button.tag);
}

//加入购物车
-(void)addAction:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSLog(@"add:%ld",(long)button.tag);
}

@end
