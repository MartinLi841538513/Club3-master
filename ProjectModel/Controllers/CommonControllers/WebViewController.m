//
//  WebViewController.m
//  Club
//
//  Created by dongway on 14-8-15.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "WebViewController.h"
#import "SVProgressHUD.h"

@interface WebViewController ()
{
    __weak IBOutlet UIWebView *webview;
    UIActivityIndicatorView *activityIndicatorView;
}
@end

@implementation WebViewController

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
    webview.delegate = self;
    
    activityIndicatorView = [[UIActivityIndicatorView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadWebPageWithString:self.urlString inWebView:webview];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    webview.hidden = YES;
    [self showActivityIndicatorView: activityIndicatorView inView:self.view];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
    webview.hidden = NO;
}

- (void)loadWebPageWithString:(NSString*)urlString inWebView:(UIWebView *)webView{
    NSURL *url =[NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(void)showActivityIndicatorView:(UIActivityIndicatorView *)activityView inView:(UIView *)view{
    
    [activityView stopAnimating];
    CGSize size = CGSizeMake(40, 40);
    [activityView setFrame:CGRectMake((DeviceFrame.size.width-size.width)/2, (DeviceFrame.size.height-size.height)/2, size.width, size.height)];
    
    activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [activityView hidesWhenStopped];
    activityView.color = [UIColor blackColor];
    [activityView startAnimating];
    [view addSubview:activityView];
}

@end







