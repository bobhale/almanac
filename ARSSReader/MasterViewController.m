//
//  MasterViewController.m
//  ARSSReader
//
//  Created by Marin Todorov on 29/10/2012
//

#import "MasterViewController.h"
#import "MBProgressHUD.h"
#import "DetailViewController.h"

#import "TableHeaderView.h"

#import "RSSLoader.h"
#import "RSSItem.h"
#import <QuartzCore/QuartzCore.h>
#import "Reachability.h"


@interface MasterViewController ()
{
    NSArray *_objects;
    NSURL* feedURL;
    UIRefreshControl* refreshControl;
    NSURL* feedURL2;
    NSMutableArray * urlArray;
    NSInteger *iDx;
    NSURL* feedURL3;
    NSURL* feedURL4;
    NSURL* feedURL5;
    int connectionTest;
    MBProgressHUD *HUD;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
       //configuration
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor colorWithRed:158/255.0 green:51/255.0 blue:69/255.0 alpha:1.0 ]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Stories", @"");
    [label sizeToFit];    /*
    UIImageView *navigationImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 75, 25)];
    navigationImage.contentMode = UIViewContentModeScaleAspectFit;
    navigationImage.image=[UIImage imageNamed:@"myface.png"];
    
    UIImageView *workaroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 75, 25)];
    [workaroundImageView addSubview:navigationImage];
    self.navigationItem.titleView=workaroundImageView;
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myface.png"]];
    */
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection"
                                                    message:@"You must be connected to the internet to use this app."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        connectionTest  = 0;
        } else {
        NSLog(@"There IS internet connection");
        connectionTest = 1;
    }
    
    if (connectionTest == 1){
        
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [HUD show:YES];
    
   // HUD.delegate = self;
    
    //[HUD showWhileExecuting:@selector(refreshFeed) onTarget:self withObject:nil animated:YES];
   // [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];

    self.title = @"Saint Paul Stories";
    
    iDx = 0;
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
     urlArray = [[NSMutableArray alloc] init];
    feedURL = [NSURL URLWithString:@"http://www.saintpaulalmanac.org/saint-paul-stories/history/feed/"];
    feedURL3 = [NSURL URLWithString:@"http://www.saintpaulalmanac.org/saint-paul-stories/places/feed/"];
    feedURL4 = [NSURL URLWithString:@"http://www.saintpaulalmanac.org/saint-paul-stories/things-we-love/feed/"];
    feedURL2 = [NSURL URLWithString:@"http://www.saintpaulalmanac.org/saint-paul-stories/other-stories/feed/"];
    feedURL5 = [NSURL URLWithString:@"http://www.saintpaulalmanac.org/saint-paul-stories/recipes/feed/"];
    [urlArray addObject:feedURL];
    [urlArray addObject:feedURL2];
    [urlArray addObject:feedURL3];
    [urlArray addObject:feedURL4];
    [urlArray addObject:feedURL5];
    
    //add refresh control to the table view
    refreshControl = [[UIRefreshControl alloc] init];
    
    [refreshControl addTarget:self
                       action:@selector(refreshInvoked:forState:)
             forControlEvents:UIControlEventValueChanged];
    
    NSString* fetchMessage = [NSString stringWithFormat:@"Fetching: %@",feedURL];
    
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:fetchMessage
                                                                     attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:10.0]}];
    
    [self.tableView addSubview: refreshControl];
    
    //add the header
    self.tableView.tableHeaderView = [[TableHeaderView alloc] initWithText:@"Fetching..."];
    
    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Category" style:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet)];
        
        NSLog(@"Just entering refresh feed");
    [self refreshFeed];
    } else {
        
        
        [alert show];

        
    }
    
}

-(void) refreshInvoked:(id)sender forState:(UIControlState)state
{
    [self refreshFeed];
}
- (IBAction)showActionSheet:(id)sender {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Select a Story Category"
        delegate:self cancelButtonTitle:@"Cancel"
        destructiveButtonTitle:nil
        otherButtonTitles:@"History",@"Other Stories",@"Places",@"Things We Love",@"Recipes", nil];
    
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackTranslucent; [popupQuery showInView:[UIApplication sharedApplication].keyWindow];
    //showInView:self.view];
    //[actionSheet
    //[self refreshFeed];

    
}

- (IBAction)runActionView:(id)sender {
NSLog(@"How do I do here");
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    
    if (buttonIndex == 0) {
        iDx = 0;        NSLog(@"Destructive Button Clicked");
    } else if (buttonIndex == 1) {
        iDx = 1;
        NSLog(@"Other Button 1 Clicked");
    } else if (buttonIndex == 2) {
        iDx = 2;
        
    } else if (buttonIndex == 3) {
        NSLog(@"Button 3");
        iDx = 3;
    } else if (buttonIndex == 4) {
        NSLog(@"Button 4");
        iDx = 4;
    } else if (buttonIndex == actionSheet.cancelButtonIndex ) {
        NSLog(@"Cancel Button Clicked");
        iDx = 0;
    }
    //[TableHeaderView setText:]
    //[TableHeaderView setText:@"Fetching Stories" ];
    //[self TableViewControl setT]
    //if (*iDx != 4) {
    if (iDx != 0){
   [(TableHeaderView*)self.tableView.tableHeaderView setText:@"Please wait while updating...."];
    [self refreshFeed];
    }
    //}
}
-(void)refreshFeed
{
    RSSLoader* rss = [[RSSLoader alloc] init];
    NSURL  *catter = [urlArray objectAtIndex:iDx];
    
    //UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
    
   // activityView.center=self.view.center;
    
    
    //[activityView startAnimating];
    
    //[self.view addSubview:activityView];
    
    [HUD show:YES];

    
    [rss fetchRssWithURL:catter
     
                complete:^(NSString *title, NSArray *results) {
                    
                    

                    //completed fetching the RSS
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        NSString *dork = [self getSubStringAfterValue:title];
                        //UI code on the main queue
                        [(TableHeaderView*)self.tableView.tableHeaderView setText:dork];
                        
                        _objects = results;
                        [self.tableView reloadData];
                        
                        // Stop refresh control
                        [refreshControl endRefreshing];
                        [HUD hide:YES];

                    });
                }];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //[self.tableView setBackgroundColor:[UIColor blackColor]];
    
    RSSItem *object = _objects[indexPath.row];
    
    cell.textLabel.attributedText = object.cellMessage;
    cell.textLabel.numberOfLines = 0;
    //[cell.layer setCornerRadius:10.0f];
    //[cell.layer setMasksToBounds:YES];
   // [cell.layer setBorderWidth:1.0f];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    //[UIColor colorWithRed:255/255.0f green:217/255.0f blue:252/255.0f alpha:1.0f];
    
    //[UIColor colorWithRed:255/255.0f green:247/255.0f blue:155/255.0f alpha:1.0f];
    //[UIColor colorWithRed:251/255.0f green:232/255.0f blue:165/255.0f alpha:1.0f];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.backgroundColor = cell.contentView.backgroundColor;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSSItem *item = [_objects objectAtIndex:indexPath.row];
    CGRect cellMessageRect = [item.cellMessage boundingRectWithSize:CGSizeMake(200,10000)
                                                            options:NSStringDrawingUsesLineFragmentOrigin
                                                            context:nil];
    return cellMessageRect.size.height;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RSSItem *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

-(NSString *)getSubStringAfterValue:(NSString *)inputString
{
    NSString *param = nil;
    NSRange start = [inputString rangeOfString:@"Saint Paul Almanac"];
    if (start.location != NSNotFound)
    {
        param = [inputString substringFromIndex:start.location + start.length];
        //NSRange end = [param rangeOfString:@"%"];
        ////if (end.location != NSNotFound)
        //{
        //    param = [param substringToIndex:end.location];
        //}
    }
    
    NSString *s = [param stringByAppendingString:@" is the ouput"];
    NSLog(@"%@" , s);
    return param;

}


@end
