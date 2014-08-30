//
//  PurchaseCarItemsViewController.m
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PurchaseCarItemsViewController.h"
#import "PurchaseCarItemsService.h"
#import <UIImageView+WebCache.h>

@interface PurchaseCarItemsViewController ()
{

    __weak IBOutlet UIButton *submitButton;
    NSString *identifier;
    PurchaseCarItemsService *puchaseCarItemsService;
    float totalNum;
}
@end

@implementation PurchaseCarItemsViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        puchaseCarItemsService = [[PurchaseCarItemsService alloc] init];
    }
    return self;
}

-(void)loadView{
    [super loadView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableview.frame = CGRectMake(0, StatusBarFrame.size.height+NavigationBarFrame.size.height, DeviceFrame.size.width, DeviceFrame.size.height-StatusBarFrame.size.height-NavigationBarFrame.size.height-50);
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    identifier = @"PurchaseCarItemCell";
    UINib *nib = [UINib nibWithNibName:@"PurchaseCarItemCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:identifier];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.tableview.frame.origin.y+self.tableview.frame.size.height+2, DeviceFrame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1];
    [self.view addSubview:line];
    
    self.selectAllButton.frame = CGRectMake(10, line.frame.origin.y+line.frame.size.height+10, 25, 25);
    
    self.totalPrice.frame = CGRectMake(self.selectAllButton.frame.origin.x+self.selectAllButton.frame.size.width+10, self.selectAllButton.frame.origin.y, 100, self.selectAllButton.frame.size.height);
    
    submitButton.frame = CGRectMake(self.totalPrice.frame.origin.x+self.totalPrice.frame.size.width+35, self.totalPrice.frame.origin.y-6, 129, 38);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"购物篮";
    self.items = (NSMutableArray<Good>*)[[NSMutableArray alloc] initWithArray:self.cartInfo.goods];
    totalNum = [puchaseCarItemsService totalPriceByitems:self.items];
    self.totalPrice.text = [NSString stringWithFormat:@"总计:￥%0.1f",totalNum];
    self.datasStorage = [puchaseCarItemsService goodsForSubmitByItems:self.items];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goToFinalConfirm"]) {
        [puchaseCarItemsService pushToFinamConfirmViewControllerWithSegue:segue fromViewController:self];
    }
}


#pragma UITableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    PurchaseCarItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    Good *good = [self.items objectAtIndex:row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,good.picture]]];
    cell.name.text = good.name;
    cell.count.text = good.num;
    cell.siglePrice.text = [NSString stringWithFormat:@"￥%@",good.discount];
    float itemTotalPrice = [good.discount floatValue]*[good.num intValue];
    cell.totalPrice.text = [NSString stringWithFormat:@"￥%0.1f",itemTotalPrice];
    cell.discount.text = [NSString stringWithFormat:@"%0.1f折优惠",[good.discount floatValue]/[good.price floatValue]*10];
    cell.delegate = self;
    cell.checkImgButton.tag = row+1;
    cell.reduceButton.tag = row;
    cell.addButton.tag = row;
    cell.deleteButton.tag = row;
    cell.tag = row;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 83.0f;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    Good *good = [self.items objectAtIndex:row];
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [puchaseCarItemsService deleteItemByGid:good.gid inPurchaseViewController:(PurchaseCarItemsViewController *)self atIndexPath:(NSIndexPath *)indexPath];
    }
}



#pragma PurchaseCarItemCellDelegate
-(void)checkAction:(id)sender InCell:(UITableViewCell *)cell{
    [puchaseCarItemsService checkActionInViewController:self atCell:(PurchaseCarItemCell *)cell andRow:cell.tag withDatas:self.datasStorage];
}

-(void)reduceAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;
    PurchaseCarItemCell *itemCell = (PurchaseCarItemCell *)cell;
    NSUInteger row = button.tag;
    [puchaseCarItemsService reduceInViewController:self atCell:itemCell andRow:row];
}


-(void)addAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;
    PurchaseCarItemCell *itemCell = (PurchaseCarItemCell *)cell;
    NSUInteger row = button.tag;
    [puchaseCarItemsService addInViewController:self atCell:itemCell andRow:row];
}

//这个删除，暂时隐藏了
-(void)deleteAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;
    NSUInteger row = button.tag;
    NSLog(@"deleteAction:%lu",(unsigned long)row);
}



//选择所有
- (IBAction)selectAllAction:(id)sender {
    [puchaseCarItemsService selectAllButton:(UIButton *)sender InViewController:self];
    NSLog(@"selectAllAction");
}


- (IBAction)returnItemsViewController:(id)sender {
    NSArray *viewControllers = self.navigationController.viewControllers;
    [self.navigationController popToViewController:[viewControllers objectAtIndex:1] animated:YES];
}

@end
