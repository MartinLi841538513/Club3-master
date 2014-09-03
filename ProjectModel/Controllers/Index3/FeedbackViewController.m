//
//  FeedbackViewController.m
//  Club
//
//  Created by dongway on 14-8-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedbackService.h"
@interface FeedbackViewController ()
{
    __weak IBOutlet UITextView *textview;
    FeedbackService *feedbackService;
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
    feedbackService = [[FeedbackService alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *content = textview.text;
    [feedbackService submitWithContent:content];
}



@end
