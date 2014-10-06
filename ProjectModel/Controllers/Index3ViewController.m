//
//  Index3ViewController.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index3ViewController.h"
#import "Index3Service.h"
#import "SVProgressHUD.h"
#import "UserDefaults.h"
#import "UserModel.h"
@interface Index3ViewController ()
{
    UITableView *tableview;
    NSArray *images;
    NSArray *titles;
    NSArray *subTitles;
    Index3Service *index3Service;
}
@end

@implementation Index3ViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        index3Service = [[Index3Service alloc] init];
    }
    return self;
}

-(void)loadView{
    [super loadView];
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, NavigationBarFrame.size.height+StatusBarFrame.size.height, DeviceFrame.size.width,DeviceFrame.size.height-NavigationBarFrame.size.height-TabBarFrame.size.height-StatusBarFrame.size.height)];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    images = [[NSArray alloc] initWithObjects:@"userIcon.jpg",@"account",@"qr_code",@"order",@"jiaoyi",@"return_suggest",@"ic_update", nil];
    
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    
    titles = [[NSArray alloc] initWithObjects:userModel.nickname,@"我的钱包",@"我的二维码",@"我的订单",@"联系我们",@"意见反馈",@"版本更新", nil];
    subTitles = [[NSArray alloc] initWithObjects:userModel.sname,@"",@"",@"",@"",@"",@"", nil];
    [tableview reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableviewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.section;
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.imageView.frame = CGRectMake(7, 7, 25, 25);
    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:row]];
    cell.textLabel.text = [titles objectAtIndex:row];
    cell.detailTextLabel.text = [subTitles objectAtIndex:row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSLog(@"didSelect:%ld",(long)section);
    switch (section) {
        case 0:
            [index3Service presentUserDetailViewControllerOnViewController:self];
            break;
        case 1:
            [index3Service presentMyWalletViewControllerOnViewController:self];
            break;
        case 2:
            [index3Service presentQRCodeViewControllerOnViewController:self];
            break;
        case 3:
            [index3Service presentMyOrderViewControllerOnViewController:self];
            break;
        case 4:
            [index3Service callInViewController:self];
            break;
        case 5:
            [index3Service presentFeedBackViewControllerOnViewController:self];
            break;
        case 6:
            [SVProgressHUD showSuccessWithStatus:@"已是最新版本"];
            break;
        default:
            [SVProgressHUD showImage:nil status:@"功能尚未开放，敬请期待"];
            break;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 4;
}


@end
