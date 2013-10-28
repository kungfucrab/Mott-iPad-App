//
//  ObjectToFind.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "ObjectToFind.h"

@implementation ObjectToFind

@synthesize image, x, y, height, width;

-(id)init {
    self = [super init];
    if(self){
        image = [[NSString alloc] init];
    }
    return self;
}

@end
