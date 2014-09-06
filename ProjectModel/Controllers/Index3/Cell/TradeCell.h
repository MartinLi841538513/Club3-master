//
//  TradeCell.h
//  Club
//
//  Created by MartinLi on 14-9-4.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TradeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *amount;

@end
