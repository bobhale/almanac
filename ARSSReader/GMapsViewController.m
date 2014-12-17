//
//  GMapsViewController.m
//  ARSSReader
//
//  Created by Robert Hale on 1/15/14.
//  Copyright (c) 2014 Underplot ltd. All rights reserved.
//

#import "GMapsViewController.h"


@interface GMapsViewController ()

@end

@implementation GMapsViewController

GMSMapView *mapView_;

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
    label.text = NSLocalizedString(@"Neighborhoods", @"");
    [label sizeToFit];
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:.196 green:0.3098 blue:0.52 alpha:1.0];
	// Do any additional setup after loading the view.
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    NSArray *loc = [_myMap.location componentsSeparatedByString:@","];
    double latit = [loc[0] doubleValue];
    double longit = [loc[1] doubleValue];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latit
                                                            longitude:longit
                                                                 zoom:14];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    //NSString *lat = @"44.953703";
    //NSString *longr = @"-93.089958";
    //NSArray *loc = [_myMap.location componentsSeparatedByString:@","];
    ///double latit = [loc[0] doubleValue];
    //double longit = [loc[1] doubleValue];
    marker.position = CLLocationCoordinate2DMake(latit, longit);
    marker.title = _myMap.name;
    marker.snippet = _myMap.neighborhood;
    
    //"_myMap.neighborhood;
    marker.map = mapView_;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Neighborhood Maps";
}


-(void)setMyMap:(Map *)mapObj
{
    _myMap = mapObj;
}



@end
