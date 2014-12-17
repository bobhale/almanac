//
//  CalendarViewController.m
//  ARSSReader
//
//  Created by Robert Hale on 9/20/14.
//  Copyright (c) 2014 Underplot ltd. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Arts Calendar";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor colorWithRed:158/255.0 green:51/255.0 blue:69/255.0 alpha:1.0 ]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Arts Calendar", @"");
    [label sizeToFit];
    
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myface.png"]];
    // Do any additional setup after loading the view.
   /* NSString stringWithFormat:@"<html><meta name=\"viewport\" content=\"width=320\"/><iframe src=\"http://www.google.com/calendar/embed?showTitle=0&amp;showNav=0&amp;showTabs=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=AGENDA&amp;height=600&amp;wkst=2&amp;hl=en_GB&amp;src=northadelaidefitness@gmail.com&amp;color=%23A32929&amp;ctz=Australia%2FAdelaide\" style=\"border-width: 0pt;\" mce_style=\" border-width:0 \" frameborder=\"0\" height=\"400\" width=\"300\"></iframe>"];   */
    NSString *googCal = [ NSString stringWithFormat:@"<html><meta name=\"viewport\" content=\"width=320\"/><iframe src=\"https://www.google.com/calendar/embed?showTitle=0&amp;showNav=0&amp;showTabs=0&amp;showPrint=0&amp;showCalendars=0&amp;mode=AGENDA&amp;height=600&amp;wkst=2&amp;hl=en_GB&amp;src=hcqvm3gkhpmkiavoqt9tbn8qfc@group.calendar.google.com&amp;color=%230D7813&amp;src=b775km71c6ov2v3sd957srb0lg@group.calendar.google.com&amp;color=%23B1440E&amp;src=enagcrd6jnsad48p64folpk60k@group.calendar.google.com&amp;color=%232F6309&amp;ctz=America%2FChicago\" style=\"border-width: 0pt;\" mce_style=\" border-width:0 \" frameborder=\"0\" height=\"400\" width=\"300\"></iframe>"];
    
  /*  NSString *theUrl = @"https://www.google.com/calendar/embed?showTitle=0&showPrint=0&showTabs=0&showTz=0&mode=AGENDA&height=1100&wkst=2&bgcolor=%23FFFFFF&src=hcqvm3gkhpmkiavoqt9tbn8qfc%40group.calendar.google.com&color=%230D7813&src=b775km71c6ov2v3sd957srb0lg%40group.calendar.google.com&color=%23B1440E&src=enagcrd6jnsad48p64folpk60k%40group.calendar.google.com&color=%232F6309&ctz=America%2FChicago";
   */
   // NSURL *url = [NSURL URLWithString:theUrl];
   // NSURLRequest *reqObject = [NSURLRequest requestWithURL:url];
    _viewWebview.delegate = self;
    _viewWebview.scalesPageToFit = YES;
    //[_viewWebview loadRequest:reqObject];
    [_viewWebview loadHTMLString:googCal baseURL:nil];
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
