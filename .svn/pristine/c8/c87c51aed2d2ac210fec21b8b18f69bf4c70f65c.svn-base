//
//  Index4ViewController.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index4ViewController.h"
#import "InternetRequest.h"
#import "Index4Service.h"
#import "ProduceCode.h"

@interface Index4ViewController ()
{

    __weak IBOutlet UITextView *urlTextView;
    __weak IBOutlet UITextField *infoText;
    __weak IBOutlet UITextField *modelText;
    
    Index4Service *service;
    ProduceCode *produceCode;
}
@end

@implementation Index4ViewController

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
    service = [[Index4Service alloc] init];
    NSArray *userinfos = [service getUserinfosWithUsername:@"tx" andPassword:@"123456"];
    [service printUserinfos:userinfos];
    
    produceCode = [[ProduceCode alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//生成arrayModel
- (IBAction)produceAction:(id)sender {
    NSString *urlString = urlTextView.text;
    NSString *infoString = infoText.text;
    NSString *modelString = modelText.text;
    [InternetRequest dispatch_aync_LoadDataWithUrlString:urlString complite:^(id result){
//        NSArray *datas = [result objectForKey:infoString];
        NSDictionary *dict = [result objectForKey:infoString];
        NSArray *datas = [dict objectForKey:@"order"];
        NSDictionary *data = [datas firstObject];
        NSArray *keys = data.allKeys;
        [produceCode produceCodeWithModelString:modelString andKeys:keys];

    }];
}

//生成dictionary
- (IBAction)produceDictModelAction:(id)sender {
    
    NSString *urlString = urlTextView.text;
    NSString *infoString = infoText.text;
    NSString *modelString = modelText.text;
    [InternetRequest dispatch_aync_LoadDataWithUrlString:urlString complite:^(id result){
        NSDictionary *data = [result objectForKey:infoString];
        NSArray *keys = data.allKeys;
        [produceCode produceCodeWithModelString:modelString andKeys:keys];
        
    }];

}







@end
