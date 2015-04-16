//
//  TwispViewController.m
//  Almanac
//
//  Created by Robert Hale on 4/15/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

#import "TwispViewController.h"

@interface TwispViewController () <UIWebViewDelegate>



@end

@implementation TwispViewController

UIActivityIndicatorView *loadingIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *urlAddress = @"http://www.saintpaulalmanac.org";
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2), (self.view.frame.size.height / 2), 30, 30)];
    [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [loadingIndicator setHidesWhenStopped:YES];
    _webView.delegate = self;
    [_webView addSubview:loadingIndicator];
    //NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //[tempWebview loadRequest:requestObj];
   // NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"http://www.saintpaulalmanac.org" ofType:nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [_webView reload];
}
-(void)viewDidDisappear:(BOOL)animated
{
     _webView.delegate = nil;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [loadingIndicator stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [loadingIndicator startAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
