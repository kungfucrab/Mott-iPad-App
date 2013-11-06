//
//  PageContentHelper.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/5/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageContentHelper : NSObject

+ (NSMutableArray *)getPageDataAtIndex:(int)index;
+ (int)getNumberOfPages;

@end
