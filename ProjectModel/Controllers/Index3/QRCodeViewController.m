//
//  QRCodeViewController.m
//  Club
//
//  Created by dongway on 14-8-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "QRCodeViewController.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import <UIImageView+WebCache.h>
#import "QRCodeGenerator.h"

@interface QRCodeViewController ()

@end

@implementation QRCodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的二维码";
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = userDefaults.userModel;
    self.name.text = userModel.nickname;
    self.address.text = userModel.sname;
    
    self.QRImgView.image = [QRCodeGenerator qrImageForString:userModel.qrcode imageSize:self.QRImgView.frame.size.width];
    [self.QRImgView layer].magnificationFilter = kCAFilterNearest;

    [self.userIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IP,userModel.picture]] placeholderImage:[UIImage imageNamed:@"userIcon.jpg"]];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
