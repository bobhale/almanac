//
//  MAPLoader.m
//  ARSSReader
//
//  Created by Robert Hale on 1/23/14.
//  Copyright (c) 2014 Underplot ltd. All rights reserved.
//

#import "MAPLoader.h"
#import "RXMLElement.h"
#import "Map.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation MAPLoader
-(void)fetchMapWithURL:(NSURL*)url complete:(MAPLoaderCompleteBlock)c
{
    dispatch_async(kBgQueue, ^{
        
        //work in the background
        RXMLElement *map = [RXMLElement elementFromXMLFile:@"neighbors.xml"];
        RXMLElement* title = [map child:@"city"];
        NSArray* items = [[map child:@"neighborhoods"] children:@"neighborhood"];
        
        NSMutableArray* result = [NSMutableArray arrayWithCapacity:items.count];
        
        //more code
        for (RXMLElement *e in items) {
            
            //iterate over the articles
            Map* item = [[Map alloc] init];
            item.name = [[e child:@"name"] text];
            item.neighborhood = [[e child:@"description"] text];
            item.location = [[e child:@"location"] text];
            [result addObject: item];
        }
        
        c([title text], result);
    });
    
}

@end
