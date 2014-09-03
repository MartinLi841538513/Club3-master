//
//  TradeListViewController.m
//  Club
//
//  Created by dongway on 14-8-31.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "TradeListViewController.h"
#import "TradeCell.h"
#import "NSString+MT.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"
#import "InternetRequest.h"
#import "UserDefaults.h"
#import "UserModel.h"
#import "JSONModelLib.h"
@interface TradeListViewController ()
{
    NSInteger page;
    NSMutableArray *datas;
}
@end

@implementation TradeListViewController

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
    self.title = @"交易记录";
    page = 1;
    datas = [[NSMutableArray alloc] initWithArray:self.items];
    [self setupRefresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableview addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.tableview.headerPullToRefreshText = @"下拉可以刷新了";
    self.tableview.headerReleaseToRefreshText = @"松开马上刷新了";
    self.tableview.headerRefreshingText = @"正在帮你刷新中";
    
    self.tableview.footerPullToRefreshText = @"上拉可以加载更多数据了";
    self.tableview.footerReleaseToRefreshText = @"松开马上加载更多数据了";
    self.tableview.footerRefreshingText = @"正在帮你加载中";
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    page = 1;
    [datas removeAllObjects];
    [datas addObjectsFromArray:self.items];
    [self.tableview reloadData];
    [self.tableview headerEndRefreshing];
}

- (void)footerRereshing
{
    page++;
    NSString *pageString = [NSString stringWithFormat:@"%d",page];    
    UserDefaults *userDefaults = [[UserDefaults alloc] init];
    UserModel *userModel = [userDefaults userModel];
    NSString *urlString = [NSString stringWithFormat:AmountURL,userModel.mid,pageString];
    Amount *amount = [[Amount alloc] initFromURLWithString:urlString completion:^(Amount *object,JSONModelError *error){
        NSLog(@"%@",amount);
        if (!error) {
            Info *info = object.info;
            NSArray<Trade> *trades = info.trade;
            if (trades.count<1) {
                [SVProgressHUD showErrorWithStatus:@"没有更多数据了"];
            }else{
                [datas addObjectsFromArray:trades];
                [self.tableview reloadData];
            }
            [self.tableview footerEndRefreshing];
            
        }
    }];
}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    TradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TradeCell"];
    Trade *trade = [datas objectAtIndex:row];
    cell.type.text = trade.type;
    NSString *stamp = trade.regtime;
    cell.time.text = [stamp timeType1FromStamp:stamp];
    cell.amount.text = trade.amount;
    return cell;
}

@end
