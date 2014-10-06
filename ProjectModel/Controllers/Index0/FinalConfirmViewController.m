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
#import "GoodForSubmit.h"
#import "UserDefaults.h"
#import "UserModel.h"

@interface FinalConfirmViewController ()
{

    __weak IBOutlet UILabel *tableHeader;
    __weak IBOutlet UITableView *tableview;
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UILabel *totalPrice;
    __weak IBOutlet UILabel *bottomTotalPrice;
    __weak IBOutlet UILabel *tips;
    __weak IBOutlet UIButton *submitButton;
    __weak IBOutlet UILabel *sendMethodTitle;
    
    
    __weak IBOutlet UIImageView *deliverRadio1;
    __weak IBOutlet UIImageView *deliverRadio2;
    
    __weak IBOutlet UILabel *deliverRadioTitle1;
    
    __weak IBOutlet UILabel *deliverRadioTitle2;
    __weak IBOutlet UILabel *storeInfo;
    __weak IBOutlet UIView *userInfo;
    
    
    
    NSString *identifier;
    NSArray *timeArray;
    
    FinalConfirmService *finalConfirmService;

    __weak IBOutlet UILabel *amount;
    __weak IBOutlet UILabel *redbag;
    UIKeyboardViewController *keyBoardController;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view1Height;

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
        
    self.automaticallyAdjustsScrollViewInsets = NO;

    identifier = @"ItemInfosCell";
    UINib *nib = [UINib nibWithNibName:@"ItemInfosCell" bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:identifier];
    self.tableviewHeight.constant = (self.items.count+1)*34;
    self.view1Height.constant = self.tableviewHeight.constant+106;
    keyBoardController = [[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    [keyBoardController addToolbarToKeyboard];
    NSLog(@"%@",NSStringFromCGRect(tableview.frame));

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"订单确认";
    
    
    timeArray = [[NSArray alloc]initWithObjects:@"8:00-10:00",@"10:00-12:00",@"12:00-14:00",@"15:00-18:00", nil];
    totalPrice.text = [NSString stringWithFormat:@"总额:￥%@",self.totalPriceString];
    bottomTotalPrice.text = [NSString stringWithFormat:@"总额:￥%@",self.totalPriceString];
    amount.text = [NSString stringWithFormat:@"使用账户余额：￥%@",self.account];
    redbag.text = [NSString stringWithFormat:@"使用红包余额：￥%@",self.redAccount];

    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    self.userPhone.text = userModel.mobile;
    self.sendAddress.text = userModel.address;

    NSLog(@"%@",NSStringFromCGRect(tableview.frame));

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    tableview.frame = CGRectMake(0,StatusBarFrame.size.height+NavigationBarFrame.size.height + tableHeader.frame.origin.y+tableHeader.frame.size.height+3, DeviceFrame.size.width, (self.items.count+1)*34+50);

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    scrollView.contentSize = CGSizeMake(DeviceFrame.size.width, userInfo.frame.origin.y+userInfo.frame.size.height+140);
    NSLog(@"%@",NSStringFromCGSize(scrollView.contentSize));

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    ItemInfosCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (row>0) {
        NSInteger index = row-1;
        GoodForSubmit *good = [self.items objectAtIndex:index];
        cell.name.text = good.name;
        cell.count.text = good.num;
        cell.singlePrice.text = [NSString stringWithFormat:@"￥%@/%@",good.discount,good.unit];
        cell.totalPrice.text = [NSString stringWithFormat:@"￥%0.1f",[good.discount floatValue]*[good.num integerValue]];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   {
    return 34;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma SelectedChildViewControllerDelegate
-(void)tableView:(UITableView *)tableView didSelectedCell:(UITableViewCell *)tableViewCell withController:(UIViewController *)viewController{
    [self.sendTime setTitle:tableViewCell.textLabel.text forState:UIControlStateNormal];
    [finalConfirmService hideChildController:viewController withObject:(id)self.sendTime];
    
}

#pragma - UIKeyboardViewController delegate methods

- (void)alttextFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%@", textField.text);
}

- (void)alttextViewDidEndEditing:(UITextView *)textView {
    NSLog(@"%@", textView.text);
}

#pragma UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        NSString *paypassword = [[alertView textFieldAtIndex:0] text];
        [finalConfirmService submitInViewController:self withPassword:paypassword];
    }
}

//选择送货时间
- (IBAction)selectTimeAction:(id)sender {
    
    [finalConfirmService showTimePickerViewOnView:scrollView withFrame:CGRectMake(userInfo.frame.origin.x+self.sendTime.frame.origin.x, userInfo.frame.origin.y+self.sendTime.frame.origin.y, self.sendTime.frame.size.width,0) andDatas:timeArray onTarget:self withObject:(id)sender];
}

- (IBAction)submitAction:(id)sender {
    [finalConfirmService submitActionInViewController:self];
}
- (IBAction)payMethod1:(id)sender {
    [finalConfirmService payMethod1:sender inViewController:self];
}
- (IBAction)payMethod2:(id)sender {
    [finalConfirmService payMethod2:sender inViewController:self];
}
- (IBAction)sendMethod1:(id)sender {
    [finalConfirmService sendMethod1:sender inViewController:self];
}
- (IBAction)sendMethod2:(id)sender {
    [finalConfirmService sendMethod2:sender inViewController:self];
}



@end
