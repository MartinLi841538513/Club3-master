//
//  CurrentGroupCell.h
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentGroupCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *discount;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *expectNumber;

@end
