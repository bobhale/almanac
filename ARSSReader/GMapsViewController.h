//
//  GMapsViewController.h
//  ARSSReader
//
//  Created by Robert Hale on 1/15/14.
//  Copyright (c) 2014 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "Map.h"
#import "GAITrackedViewController.h"

@interface GMapsViewController : GAITrackedViewController

@property(nonatomic,strong) Map *myMap;

@end
