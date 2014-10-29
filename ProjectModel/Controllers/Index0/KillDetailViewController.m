//
//  KillDetailViewController.m
//  Club
//
//  Created by MartinLi on 14-10-22.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "KillDetailViewController.h"
#import "KillDetailCell.h"
#import <UIImageView+WebCache.h>
#import "SVProgressHUD.h"
#import "GroupService.h"

@interface KillDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSTimer *timer;
    int countDownSeconds;
    GroupService *groupService;
}
@end

@implementation KillDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.good.name;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTimer) userInfo:nil repeats:YES];
    countDownSeconds = self.good.seconds;
    NSLog(@"%@",self.good.gid);
    groupService = [[GroupService alloc] init];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KillDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KillDetailCell" forIndexPath:indexPath];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,self.good.bigpicture]]];
    cell.price.text = [NSString stringWithFormat:@"%@元/%@",self.good.price,self.good.unit];
    cell.discount.text = [NSString stringWithFormat:@"%@元/%@",self.good.discount,self.good.unit];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (IBAction)buyAction:(id)sender {
    if (countDownSeconds==0) {
        [SVProgressHUD showSuccessWithStatus:@"正在开发中"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"还没到时间"];
    }
}

-(void)countDownTimer{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    KillDetailCell *cell = (KillDetailCell *)[self.tableview cellForRowAtIndexPath:indexPath];
    if (countDownSeconds==0) {
        [self.buyButton setBackgroundColor:[UIColor redColor]];
        [timer invalidate];
    }else{
        countDownSeconds--;
        cell.result.text = [NSString stringWithFormat:@"距离开抢时间%@",[groupService toDetailTime:countDownSeconds]];
    }
}

@end
