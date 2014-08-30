//
//  PurchaseCarItemsViewController.m
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "PurchaseCarItemsViewController.h"
#import "PurchaseCarItemsService.h"

@interface PurchaseCarItemsViewController ()
{

    __weak IBOutlet UIButton *selectAllButton;
    __weak IBOutlet UITableView *tableview;
    __weak IBOutlet UILabel *totalPrice;
    __weak IBOutlet UIButton *submitButton;
    NSString *identifier;
    PurchaseCarItemsService *puchaseCarItemsService;
    NSMutableArray *items;
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
    tableview.frame = CGRectMake(0, StatusBarFrame.size.height+NavigationBarFrame.size.height, DeviceFrame.size.width, DeviceFrame.size.height-StatusBarFrame.size.height-NavigationBarFrame.size.height-50);
    tableview.delegate = self;
    tableview.dataSource = self;
    identifier = @"PurchaseCarItemCell";
    UINib *nib = [UINib nibWithNibName:@"PurchaseCarItemCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:identifier];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, tableview.frame.origin.y+tableview.frame.size.height+2, DeviceFrame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1];
    [self.view addSubview:line];
    
    selectAllButton.frame = CGRectMake(10, line.frame.origin.y+line.frame.size.height+10, 25, 25);
    
    totalPrice.frame = CGRectMake(selectAllButton.frame.origin.x+selectAllButton.frame.size.width+10, selectAllButton.frame.origin.y, 100, selectAllButton.frame.size.height);
    
    submitButton.frame = CGRectMake(totalPrice.frame.origin.x+totalPrice.frame.size.width+35, totalPrice.frame.origin.y-6, 129, 38);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"购物篮";
    items = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UITableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    PurchaseCarItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.delegate = self;
    cell.checkImgButton.tag = row;
    cell.reduceButton.tag = row;
    cell.addButton.tag = row;
    cell.deleteButton.tag = row;
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
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        NSArray *cells = [[NSArray alloc] initWithObjects:indexPath, nil];
        [tableview beginUpdates];
        [items removeObjectAtIndex:row];
        [tableview deleteRowsAtIndexPaths:cells withRowAnimation: UITableViewRowAnimationLeft];
        [tableview endUpdates];
    }
}

-(void)checkAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;

    NSUInteger row = button.tag;
    NSLog(@"checkAction:%lu",(unsigned long)row);
}

-(void)reduceAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;
    PurchaseCarItemCell *itemCell = (PurchaseCarItemCell *)cell;
    itemCell.count.text = [puchaseCarItemsService reduceNumber:itemCell.count];
    NSUInteger row = button.tag;
    NSLog(@"reduceAction:%lu",(unsigned long)row);
}

-(void)addAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;
    PurchaseCarItemCell *itemCell = (PurchaseCarItemCell *)cell;
    itemCell.count.text = [puchaseCarItemsService addNumber:itemCell.count];
    NSUInteger row = button.tag;
    NSLog(@"addAction:%lu",(unsigned long)row);
}

-(void)deleteAction:(id)sender InCell:(UITableViewCell *)cell{
    UIButton *button = (UIButton *)sender;
    NSUInteger row = button.tag;
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:row inSection:0];
//    NSArray *cells = [[NSArray alloc] initWithObjects:indexPath, nil];
//    [tableview beginUpdates];
//    [items removeObjectAtIndex:row];
//    [tableview deleteRowsAtIndexPaths:cells withRowAnimation: UITableViewRowAnimationLeft];
//    [tableview endUpdates];
    NSLog(@"deleteAction:%lu",(unsigned long)row);
}



//选择所有
- (IBAction)selectAllAction:(id)sender {
    NSLog(@"selectAllAction");
}

- (IBAction)submitAction:(id)sender {
    [puchaseCarItemsService presentFinalConfirmViewControllerOnViewController:self];
}

@end
