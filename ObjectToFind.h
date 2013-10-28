//
//  ObjectToFind.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/28/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectToFind : NSObject {
    NSInteger x;
    NSInteger y;
    NSInteger height;
    NSInteger width;
    NSString *image;
}

@property(assign) NSInteger x;
@property(assign) NSInteger y;
@property(assign) NSInteger height;
@property(assign) NSInteger width;
@property(nonatomic, retain) NSString *image;

@end
