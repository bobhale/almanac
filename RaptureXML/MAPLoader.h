//
//  MAPLoader.h
//  ARSSReader
//
//  Created by Robert Hale on 1/23/14.
//  Copyright (c) 2014 F1 Data Systems, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MAPLoaderCompleteBlock)(NSString* title, NSArray* results);

@interface MAPLoader : NSObject

-(void)fetchMapWithURL:(NSURL*)url complete:(MAPLoaderCompleteBlock)c;

@end
