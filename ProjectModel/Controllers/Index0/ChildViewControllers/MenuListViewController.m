//
//  MenuListViewController.m
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "MenuListViewController.h"
#import "MenuCollectionCell.h"

@interface MenuListViewController ()
{

    NSString *identifier;

}
@end

@implementation MenuListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    identifier = @"MenuCollectionCell";
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(70, 27);
    self.collectionview.collectionViewLayout = layout;
    UINib *nib = [UINib nibWithNibName:@"MenuCollectionCell" bundle:nil];
    [self.collectionview registerNib:nib forCellWithReuseIdentifier:identifier];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.menuItems.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    MenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSDictionary *dict = [self.menuItems objectAtIndex:row];
    cell.titleLabel.text = [dict objectForKey:@"name"];
    return cell;
    
}


#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSLog(@"didSelect:%d",row);
    [self.delegate itemSelectedActionWithIndex:row withObjects:self.menuItems];
}
@end