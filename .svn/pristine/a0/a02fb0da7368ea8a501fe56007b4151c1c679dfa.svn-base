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

@interface BuyViewController ()
{
    UICollectionView *collectionview;
    UITableView *tableview;
    NSString *collectionviewCellIdentifier;
    NSString *tableviewCellIdentifier;
    UIColor *color;//黑色
    UIColor *color1;//主灰色
    UIColor *color2;//主绿色
    NSMutableArray *menuItems;
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
    
    tableview = [self tableview];
    [self.view addSubview:tableview];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    menuItems = [[NSMutableArray alloc] initWithObjects:@"今日特卖",@"家政清洁",@"地板保养",@"空气净化",@"其他加盟", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化UIcollectionview
-(UICollectionView *)collectionview{
    collectionviewCellIdentifier = @"MenuCollectionCell";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, 33) collectionViewLayout: layout];
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
-(UITableView *)tableview{
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
    cell.titleLabel.text = [menuItems objectAtIndex:row];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(70, 27);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSLog(@"didSelect:%ld",(long)section);
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:tableviewCellIdentifier forIndexPath:indexPath];
    cell.buyButton.tag = section;
    cell.addButton.tag = section;
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemDetailViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
    NSLog(@"didSelect:%ld",(long)section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 93;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
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
