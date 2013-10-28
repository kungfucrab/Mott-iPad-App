//
//  FullImagePage.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "FullImagePage.h"

@implementation FullImagePage

@synthesize image;

-(id)init {
    self = [super init];
    if(self){
        image = [[NSString alloc] init];
    }
    return self;
}

@end
