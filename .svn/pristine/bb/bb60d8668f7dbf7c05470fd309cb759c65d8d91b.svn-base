//
//  ItemCell.h
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UITableViewCellDelegate <NSObject>

@optional
-(void)buyAction:(id)sender;
-(void)addAction:(id)sender;

@end

@interface ItemCell : UITableViewCell

@property (nonatomic,retain)id<UITableViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *pastPrice;
@property (weak, nonatomic) IBOutlet UILabel *currenPrice;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *discout;

- (IBAction)buyAction:(id)sender;
- (IBAction)addAction:(id)sender;


@end
