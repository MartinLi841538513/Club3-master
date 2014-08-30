//
//  ItemDetailViewController.m
//  Club
//
//  Created by dongway on 14-8-11.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ItemDetailService.h"
#import <UIImageView+WebCache.h>

@interface ItemDetailViewController ()
{
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
    self.title = self.goodModel.name;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,self.goodModel.bigpicture]]];
    self.currentPrice.text = [NSString stringWithFormat:@"%@元/%@",self.goodModel.discount,self.goodModel.unit];
    self.pastPrice.text = [NSString stringWithFormat:@"%@元/%@",self.goodModel.price,self.goodModel.unit];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"purchaseCar"]) {
        //购物车
        [itemDetailService itemsInCartShowWithSegue:segue];
    }else if([segue.identifier isEqualToString:@"buy"]){
        //立即购买
        NSString *count = self.count.text;
        [itemDetailService presentPurchaseCarViewControllerOnViewController:self withSegue:(UIStoryboardSegue *)segue andItemCount:count];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reduceAction:(id)sender {
    self.count.text = [itemDetailService reduceNumber:self.count];
}

- (IBAction)addAction:(id)sender {
    self.count.text = [itemDetailService addNumber:self.count];
}


- (IBAction)addToPurchaseCar:(id)sender {
    NSString *gid = self.goodModel.gid;
    NSString *num = self.count.text;
    [itemDetailService addToPurchaseCarWithGid:gid andNum:num];
}

@end
