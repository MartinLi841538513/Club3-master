//
//  ItemDetailViewController.h
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodModel.h"
@interface ItemDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *currentPrice;
@property (weak, nonatomic) IBOutlet UILabel *pastPrice;
@property (weak, nonatomic) IBOutlet UILabel *count;

@property(strong,nonatomic) GoodModel *goodModel;
@end
