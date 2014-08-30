//
//  FinalConfirmViewController.m
//  Club
//
//  Created by dongway on 14-8-12.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "FinalConfirmViewController.h"
#import "ItemInfosCell.h"
#import "FinalConfirmService.h"

@interface FinalConfirmViewController ()
{

    __weak IBOutlet UILabel *tableHeader;
    __weak IBOutlet UITableView *tableview;
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UILabel *totalPrice;
    __weak IBOutlet UILabel *tips;
    __weak IBOutlet UIButton *submitButton;
    __weak IBOutlet UILabel *sendMethodTitle;
    
    
    __weak IBOutlet UIImageView *deliverRadio1;
    __weak IBOutlet UIImageView *deliverRadio2;
    
    __weak IBOutlet UILabel *deliverRadioTitle1;
    
    __weak IBOutlet UILabel *deliverRadioTitle2;
    __weak IBOutlet UILabel *storeInfo;
    __weak IBOutlet UIView *userInfo;
    
    __weak IBOutlet UIView *seperateLine;
    
    __weak IBOutlet UIButton *sendTime;
    __weak IBOutlet UITextField *sendAddress;
    __weak IBOutlet UITextField *userMessage;
    
    NSString *identifier;
    NSArray *items;
    NSArray *timeArray;
    
    FinalConfirmService *finalConfirmService;

}
@end

@implementation FinalConfirmViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        finalConfirmService = [[FinalConfirmService alloc] init];
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    self.view.translatesAutoresizingMaskIntoConstraints=YES;
    
    tableHeader.frame = CGRectMake(0, scrollView.frame.origin.y, DeviceFrame.size.width, 35);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.scrollEnabled = NO;
    identifier = @"ItemInfosCell";
    UINib *nib = [UINib nibWithNibName:@"ItemInfosCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:identifier];
    items = [[NSArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"", nil];
    tableview.translatesAutoresizingMaskIntoConstraints = YES;
    if (DeviceFrame.size.height==480) {
        tableview.frame = CGRectMake(0,StatusBarFrame.size.height+NavigationBarFrame.size.height + tableHeader.frame.origin.y+tableHeader.frame.size.height+3, DeviceFrame.size.width, items.count*34+80);
    }else{
        tableview.frame = CGRectMake(0,StatusBarFrame.size.height+NavigationBarFrame.size.height + tableHeader.frame.origin.y+tableHeader.frame.size.height+3, DeviceFrame.size.width, items.count*34);
    }

    totalPrice.frame = CGRectMake(218, tableview.frame.origin.y+tableview.frame.size.height-60, 87, 26);
    tips.frame = CGRectMake(3, tableview.frame.origin.y+tableview.frame.size.height-30, DeviceFrame.size.width, 40);
    sendMethodTitle.frame = CGRectMake(0, tips.frame.origin.y+tips.frame.size.height, DeviceFrame.size.width, 31);
    deliverRadio1.frame = CGRectMake(5, sendMethodTitle.frame.origin.y+sendMethodTitle.frame.size.height+5, 25, 25);
    deliverRadioTitle1.frame = CGRectMake(deliverRadio1.frame.origin.x+deliverRadio1.frame.size.width +10, deliverRadio1.frame.origin.y +2, 70, 25);
    storeInfo.frame = CGRectMake(deliverRadioTitle1.frame.origin.x, deliverRadioTitle1.frame.origin.y + deliverRadioTitle1.frame.size.height + 5, 274, 33);
    deliverRadio2.frame = CGRectMake(deliverRadio1.frame.origin.x, storeInfo.frame.origin.y + storeInfo.frame.size.height +2, 25, 25);
    deliverRadioTitle2.frame = CGRectMake(deliverRadioTitle1.frame.origin.x, deliverRadio2.frame.origin.y +2, 70, 25);
    userInfo.frame = CGRectMake(deliverRadioTitle2.frame.origin.x +10, deliverRadioTitle2.frame.origin.y + deliverRadioTitle2.frame.size.height + 5, 253, 103);
    
    scrollView.scrollEnabled = YES;
    scrollView.frame = CGRectMake(0, StatusBarFrame.size.height+NavigationBarFrame.size.height, DeviceFrame.size.width, DeviceFrame.size.height-StatusBarFrame.size.height-NavigationBarFrame.size.height-50);
    scrollView.contentSize = CGSizeMake(DeviceFrame.size.width, userInfo.frame.origin.y+userInfo.frame.size.height+80);
    
    seperateLine.frame = CGRectMake(0, scrollView.frame.origin.y+scrollView.frame.size.height+2, DeviceFrame.size.width, 1);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"订单确认";
    timeArray = [[NSArray alloc]initWithObjects:@"8:00-10:00",@"10:00-12:00",@"12:00-14:00",@"15:00-18:00", nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemInfosCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   {
    return 34;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma SelectedChildViewControllerDelegate
-(void)tableView:(UITableView *)tableView didSelectedCell:(UITableViewCell *)tableViewCell withController:(UIViewController *)viewController{
    [sendTime setTitle:tableViewCell.textLabel.text forState:UIControlStateNormal];
    [finalConfirmService hideChildController:viewController withObject:(id)sendTime];
    
}

//选择送货时间
- (IBAction)selectTimeAction:(id)sender {
    [finalConfirmService showTimePickerViewOnView:scrollView withFrame:CGRectMake(userInfo.frame.origin.x+sendTime.frame.origin.x, userInfo.frame.origin.y+sendTime.frame.origin.y, sendTime.frame.size.width,0) andDatas:timeArray onTarget:self withObject:(id)sender];
}

- (IBAction)submitAction:(id)sender {
}



@end
