//
//  SearchGamePage.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchGamePage : NSObject {
    NSString *image;
    NSMutableArray *objectsToFind;
}

@property(nonatomic, retain) NSString *image;
@property(nonatomic, retain) NSMutableArray *objectsToFind;

@end
