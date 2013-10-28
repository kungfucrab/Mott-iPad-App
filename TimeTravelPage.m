//
//  TimeTravelPage.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "TimeTravelPage.h"

@implementation TimeTravelPage

@synthesize flyingObjects, image, timeMachineImage;

-(id)init {
    self = [super init];
    if(self){
        flyingObjects = [[NSMutableArray alloc] init];
        image = [[NSString alloc] init];
        timeMachineImage = [[NSString alloc] init];
    }
    return self;
}

@end

