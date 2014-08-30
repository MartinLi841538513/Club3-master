//
//  PurchaseCarItemCell.m
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PurchaseCarItemCell.h"

@implementation PurchaseCarItemCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkAction:(id)sender {
    [self.delegate checkAction:sender InCell:self];
}
- (IBAction)reduceAction:(id)sender {
    [self.delegate reduceAction:sender InCell:self];
}
- (IBAction)addAction:(id)sender {
    [self.delegate addAction:sender InCell:self];
}
- (IBAction)deleteAction:(id)sender {
    [self.delegate deleteAction:sender InCell:self];
}
@end
