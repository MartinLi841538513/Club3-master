//
//  GroupDetailViewController.m
//  Club
//
//  Created by MartinLi on 14-10-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "GroupDetailViewController.h"
#import <UIImageView+WebCache.h>
#import "GroupService.h"
#import "ItemDetailService.h"
@interface GroupDetailViewController ()<UIAlertViewDelegate>
{
    GroupService *groupService;
    ItemDetailService *itemDetailService;
}
@end

@implementation GroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.groupGood.name;
    self.expect_num.text = [NSString stringWithFormat:@"%@人起团",self.groupGood.expect_num];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,self.groupGood.picture]]];
    self.actual_num.text = [NSString stringWithFormat:@"%@人已参团",self.groupGood.actual_num];
    self.price.text = [NSString stringWithFormat:@"原价:%@元/%@",self.groupGood.price,self.groupGood.unit];
    self.discount.text = [NSString stringWithFormat:@"%@元/%@",self.groupGood.discount,self.groupGood.unit];
    
    groupService = [[GroupService alloc] init];
    itemDetailService = [[ItemDetailService alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)reduceAction:(id)sender {
    self.number.text = [itemDetailService reduceNumber:self.number];
}
- (IBAction)addAction:(id)sender {
    self.number.text = [itemDetailService addNumber:self.number];
}
- (IBAction)addGroupAction:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"支付密码" message:@"支付密码默认为登陆密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alertView show];
}

#pragma UIAlertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *password = [[alertView textFieldAtIndex:0] text];
    if (buttonIndex==0) {
        
    }else if(buttonIndex == 1){
        [groupService addToGroupInViewController:self withPassword:password];
    }
}
@end
