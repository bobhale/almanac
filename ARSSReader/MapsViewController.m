//
//  MapsViewController.m
//  ARSSReader
//
//  Created by Robert Hale on 5/13/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "MapsViewController.h"
#import "Map.h"
#import "GMapsViewController.h"
#import "MAPLoader.h"
#import <QuartzCore/QuartzCore.h>

@interface MapsViewController ()

@end

@implementation MapsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
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
    label.text = NSLocalizedString(@"Neighborhood Maps", @"");
    [label sizeToFit];
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myface.png"]];
    /*
    NSMutableArray *_maps = [NSMutableArray arrayWithCapacity:20];
    Map *map = [[Map alloc] init];
    map.name = @"Downtown";
    map.location = @"45.00,93.00";
    map.neighborhood = @"Lowertown, Downtown, Mississippi River";
    [_maps addObject:map];
    
    map = [[Map alloc] init];
    map.name = @"Como";
    map.location = @"45.00,93.00";
    map.neighborhood = @"Como Park Zoo, Conservatory and lake Pavilion. Summertime concerts and weddings.";
    
    [_maps addObject:map];
    
    map = [[Map alloc] init];
    map.name = @"FrogTown";
    map.location = @"45.00,93.00";
    map.neighborhood = @"Traditionally an immigrant community. Home to Little Mekong";
    [_maps addObject:map];
    
    self.MyMaparray = _maps;
     */
    
    //[self.tableView setBackgroundColor:[UIColor blackColor]];
    
    [self refreshFeed];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.MyMaparray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MapCell"];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MapCell" ];
    }
    
    
    Map *map = (self.MyMaparray)[indexPath.row];
     cell.textLabel.text = map.name;
    cell.textLabel.textColor = [UIColor blackColor];
     cell.detailTextLabel.text  = map.neighborhood;
    cell.detailTextLabel.textColor = [UIColor colorWithRed:158/255.0f green:51/255.0f blue:69/255.0f alpha:1.0f];
    //[cell.layer setCornerRadius:10.0f];
    //[cell.layer setMasksToBounds:YES];
    //[cell.layer setBorderWidth:1.0f];
    //cell.contentView.backgroundColor = [UIColor colorWithRed:247/255.0f green:206/255.0f blue:0/255.0f alpha:1.0f];
    // Configure the cell...
    
    return cell;
}

-(void)refreshFeed
{
    MAPLoader* datafeed = [[MAPLoader alloc] init];
    NSURL  *catter = [[NSURL alloc] initWithString:@"nowheretogo"];
    [datafeed fetchMapWithURL:catter
     
                complete:^(NSString *title, NSArray *results) {
                    
                    //completed fetching the RSS
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        //UI code on the main queue
                       // [(TableHeaderView*)self.tableView.tableHeaderView setText:title];
                        
                        self.MyMaparray = results;
                        
                        [self.tableView reloadData];
                        
                        // Stop refresh control
                        //[refreshControl endRefreshing];
                    });
                }];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showMap"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Map *object = _MyMaparray[indexPath.row];
        //NSString *dogo = @"COMOPARK";
        [[segue destinationViewController] setMyMap:object];
    }
}

@end
