//
//  PageContentHelper.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/5/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "PageContentHelper.h"

//All the data structures for page Content
#import "FullImagePage.h"
#import "TimeTravelPage.h"
#import "SearchGamePage.h"
#import "ObjectToFind.h"

@implementation PageContentHelper

//private variables
NSMutableArray *pageNames;

- (id)init {
    self = [super init];
    if(self){
        //init all variables when object created
        pageNames = [[NSMutableArray alloc]init];
        
        //add all the names of each page related
        //to each method name and in order
        [pageNames addObject:@"introPage"];
        [pageNames addObject:@"timeTravel"];
        [pageNames addObject:@"dinoPage1Game"];
        [pageNames addObject:@"dinoPage2"];
        [pageNames addObject:@"dinoPage3Game"];
        [pageNames addObject:@"timeTravel"];
        [pageNames addObject:@"finalPage"];
    }
    return self;
}

+ (int)getNumberOfPages {
    return [pageNames count];
}

+ (NSDictionary *)getPageDataAtIndex:(int)index {
    NSString *currentString = [pageNames objectAtIndex:index];
    NSMutableDictionary *payload = [[NSMutableDictionary alloc] init];
    
    if([@"introPage" isEqualToString:currentString]){
        FullImagePage *data = [self getIntroPage];
        [payload setObject:@"FullImagePage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    else if([@"timeTravel" isEqualToString:currentString]){
        TimeTravelPage *data = [self getTimeTravelPage];
        [payload setObject:@"TimeTravelPage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    else if([@"dinoPage1Game" isEqualToString:currentString]){
        SearchGamePage *data = [self getDinoPage1Game];
        [payload setObject:@"SearchGamePage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    else if([@"dinoPage2" isEqualToString:currentString]){
        FullImagePage *data = [self getDinoPage2];
        [payload setObject:@"FullImagePage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    else if([@"dinoPage3Game" isEqualToString:currentString]){
        SearchGamePage *data = [self getDinoPage3Game];
        [payload setObject:@"SearchGamePage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    else if([@"finalPage" isEqualToString:currentString]){
        FullImagePage *data = [self getFinalPage];
        [payload setObject:@"FullImagePage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    [payload setObject:@"None" forKey:@"type"];
    [payload setObject:nil forKey:@"data"];
    return payload;
}

+ (TimeTravelPage *)getTimeTravelPage {
    TimeTravelPage *page = [[TimeTravelPage alloc] init];
    page.image = @"timetravel.png";
    return page;
}

+ (FullImagePage *)getIntroPage {
    FullImagePage *page = [[FullImagePage alloc] init];
    page.image = @"IntroPage.png";
    return page;
}

+ (SearchGamePage *)getDinoPage1Game {
    SearchGamePage *page = [[SearchGamePage alloc] init];
    page.image = @"DinoPage1Game.png";
    return page;
}

+ (FullImagePage *)getDinoPage2 {
    FullImagePage *page = [[FullImagePage alloc] init];
    page.image = @"DinoPage2.png";
    return page;
}

+ (SearchGamePage *)getDinoPage3Game {
    SearchGamePage *page = [[SearchGamePage alloc] init];
    page.image = @"DinoPage3Game.png";
    return page;
}

+ (FullImagePage *)getFinalPage {
    FullImagePage *page = [[FullImagePage alloc] init];
    page.image = @"FinalPage.png";
    return page;
}

@end
