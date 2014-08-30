//
//  BuyOrRobViewController.h
//  Club
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RobModel.h"
@interface RobViewController : UIViewController

@property(nonatomic,retain)RobModel *robModel;
@property (weak, nonatomic) IBOutlet UIButton *startTimeButton;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPastPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemCount;
@end
