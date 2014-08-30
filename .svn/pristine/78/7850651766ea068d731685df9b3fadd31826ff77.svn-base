//
//  ItemDetailViewController.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ItemDetailService.h"

@interface ItemDetailViewController ()
{
    __weak IBOutlet UILabel *count;
    ItemDetailService *itemDetailService;
}
@end

@implementation ItemDetailViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        itemDetailService = [[ItemDetailService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"广西大红袍－西红柿";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reduceAction:(id)sender {
    count.text = [itemDetailService reduceNumber:count];
}

- (IBAction)addAction:(id)sender {
    count.text = [itemDetailService addNumber:count];
}

- (IBAction)buyAction:(id)sender {
    [itemDetailService presentPurchaseCarViewControllerOnViewController:self];
}

- (IBAction)addToPurchaseCar:(id)sender {
}

@end
