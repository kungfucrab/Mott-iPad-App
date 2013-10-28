//
//  TimeTravelPage.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeTravelPage : NSObject {
    NSMutableArray *flyingObjects;
    NSString *image;
    NSString *timeMachineImage;
}

@property(nonatomic, retain) NSMutableArray *flyingObjects;
@property(nonatomic, retain) NSString *image;
@property(nonatomic, retain) NSString *timeMachineImage;

@end
