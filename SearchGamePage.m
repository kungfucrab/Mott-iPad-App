//
//  SearchGamePage.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "SearchGamePage.h"

@implementation SearchGamePage

@synthesize image, objectsToFind;

-(id)init {
    self = [super init];
    if(self){
        objectsToFind = [[NSMutableArray alloc] init];
        image = [[NSString alloc] init];
    }
    return self;
}

@end
