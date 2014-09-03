//
//  MenuListViewController.m
//  Club
//
//  Created by MartinLi on 14-8-23.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "MenuListViewController.h"
#import "SubMenuCell.h"

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
    identifier = @"SubMenuCell";
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(60, 27);
    layout.minimumInteritemSpacing = 0;
    self.collectionview.collectionViewLayout = layout;
    UINib *nib = [UINib nibWithNibName:@"SubMenuCell" bundle:nil];
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
    SubMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSDictionary *dict = [self.menuItems objectAtIndex:row];
    cell.name.text = [dict objectForKey:@"name"];
    if (row==0) {
        cell.name.textColor = MainGreenColor;
    }else{
        cell.name.textColor = [UIColor blackColor];
    }
    return cell;
    
}


#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSLog(@"didSelect:%d",row);
    [self setSelectedColorInCollectionView:collectionView withSelectedRow:row withDatas:self.menuItems];
    [self.delegate itemSelectedActionWithIndex:row withObjects:self.menuItems];
}


-(void)setSelectedColorInCollectionView:(UICollectionView *)collectionView withSelectedRow:(NSInteger)row withDatas:(NSArray *)datas{
    NSInteger count = datas.count;
    for (NSInteger i=0; i<count; i++) {
        NSIndexPath *indpath = [NSIndexPath indexPathForRow:i inSection:0];
        SubMenuCell *cell = (SubMenuCell *)[collectionView cellForItemAtIndexPath:indpath];
        if (i==row) {
            cell.name.textColor = MainGreenColor;
        }else{
            cell.name.textColor = [UIColor blackColor];
        }
    }
}
@end