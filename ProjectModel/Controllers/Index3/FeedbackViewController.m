//
//  FeedbackViewController.m
//  Club
//
//  Created by dongway on 14-8-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "FeedbackViewController.h"
#import "SVProgressHUD.h"
#import "InternetRequest.h"

@interface FeedbackViewController ()
{
    __weak IBOutlet UITextView *textview;

}
@end

@implementation FeedbackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    [super loadView];
    [textview becomeFirstResponder];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"意见反馈";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *content = textview.text;
    [self submitWithContent:content];
}

-(void)submitWithContent:(NSString *)content{
    if (content==nil||content.length<5) {
        [SVProgressHUD showErrorWithStatus:@"字数不够"];
    }else{
        [SVProgressHUD show];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [SVProgressHUD showSuccessWithStatus:@"提交成功"];
            });
            
        });
    }
}


@end
