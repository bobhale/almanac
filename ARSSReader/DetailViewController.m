//
//  DetailViewController.m
//  ARSSReader
//
//  Created by Marin Todorov on 29/10/2012.
//

#import "DetailViewController.h"
#import "RSSItem.h"

@interface DetailViewController () <UIWebViewDelegate>
{
    IBOutlet UIWebView* webView;
    UIActivityIndicatorView *loadingIndicator;

}
@end

@implementation DetailViewController

-(void)viewDidAppear:(BOOL)animated
{
    RSSItem* item = (RSSItem*)self.detailItem;
    //self.title = item.title;
        loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 160, 20,20)]; [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [loadingIndicator setHidesWhenStopped:YES];
    //- See more at: http://blog.filipekberg.se/2010/12/01/displaying-a-loading-indicator-for-uiwebview-using-uiactivityindicatorview/#sthash.LPAghEHZ.dpuf
    webView.delegate = self;
    [webView addSubview:loadingIndicator];
    NSURLRequest* articleRequest = [NSURLRequest requestWithURL: item.link];
    webView.backgroundColor = [UIColor clearColor];
    [webView loadRequest: articleRequest];
}

-(void)viewDidDisappear:(BOOL)animated
{
    webView.delegate = nil;
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

@end