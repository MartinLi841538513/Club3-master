//
//  PurchaseCarItemCell.h
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PurchaseCarItemCellDelegate <NSObject>

@optional
-(void)checkAction:(id)sender InCell:(UITableViewCell *)cell;
-(void)reduceAction:(id)sender InCell:(UITableViewCell *)cell;
-(void)addAction:(id)sender InCell:(UITableViewCell *)cell;
-(void)deleteAction:(id)sender InCell:(UITableViewCell *)cell;

@end

@interface PurchaseCarItemCell : UITableViewCell

@property(nonatomic,retain)id<PurchaseCarItemCellDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIButton *checkImgButton;
@property (weak, nonatomic) IBOutlet UIButton *reduceButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *siglePrice;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UILabel *discount;
@property (weak, nonatomic) IBOutlet UILabel *count;

@end
