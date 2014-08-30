//
//  ItemCell.m
//  Club
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buyAction:(id)sender {
    [self.delegate buyAction:sender];
}

- (IBAction)addAction:(id)sender {
    [self.delegate addAction:sender];
}
@end
