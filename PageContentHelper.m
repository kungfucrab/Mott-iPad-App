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
NSMutableArray *chapterPictures;

- (id)init {
    self = [super init];
    if(self){
        //init all variables when object created
        pageNames = [[NSMutableArray alloc]init];
        chapterPictures = [[NSMutableArray alloc]init];
        
        //add all the names of each page related
        //to each method name and in order
        [pageNames addObject:@"introPage"];
        [pageNames addObject:@"timeTravel"];
        [pageNames addObject:@"spaceGame"];
        [pageNames addObject:@"dinoPage2"];
        [pageNames addObject:@"spaceGame"];
        [pageNames addObject:@"timeTravel"];
        [pageNames addObject:@"finalPage"];
        
        [chapterPictures addObject:@"IntroPage.png"];
        [chapterPictures addObject:@"timetravel.png"];
        [chapterPictures addObject:@"Space_FinalDrawing.png"];
        [chapterPictures addObject:@"DinoPage2.png"];
        [chapterPictures addObject:@"Space_FinalDrawing.png"];
        [chapterPictures addObject:@"timetravel.png"];
        [chapterPictures addObject:@"FinalPage.png"];
    }
    return self;
}

- (int)getNumberOfPages {
    return [pageNames count];
}

- (int)getNumberOfChapterPages {
    double value = [pageNames count];
    return ceil(value/6);
}

- (NSMutableDictionary *)getPageDataAtIndex:(int)index {
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
    else if([@"spaceGame" isEqualToString:currentString]){
        SearchGamePage *data = [self getSpaceGamePage];
        [payload setObject:@"SearchGamePage" forKey:@"type"];
        [payload setObject:data forKey:@"data"];
        return payload;
    }
    [payload setObject:@"None" forKey:@"type"];
    [payload setObject:nil forKey:@"data"];
    return payload;
}

- (TimeTravelPage *)getTimeTravelPage {
    TimeTravelPage *page = [[TimeTravelPage alloc] init];
    page.image = @"timetravel.png";
    return page;
}

- (FullImagePage *)getIntroPage {
    FullImagePage *page = [[FullImagePage alloc] init];
    page.image = @"IntroPage.png";
    return page;
}

- (SearchGamePage *)getDinoPage1Game {
    SearchGamePage *page = [[SearchGamePage alloc] init];
    page.image = @"DinoGamePage1Game.png";
    return page;
}

- (FullImagePage *)getDinoPage2 {
    FullImagePage *page = [[FullImagePage alloc] init];
    page.image = @"DinoPage2.png";
    return page;
}

- (SearchGamePage *)getDinoPage3Game {
    SearchGamePage *page = [[SearchGamePage alloc] init];
    page.image = @"DinoGamePage3Game.png";
    return page;
}

- (FullImagePage *)getFinalPage {
    FullImagePage *page = [[FullImagePage alloc] init];
    page.image = @"FinalPage.png";
    return page;
}

- (SearchGamePage *)getSpaceGamePage {
    SearchGamePage *page = [[SearchGamePage alloc] init];
    page.image = @"Space_FinalDrawing.png";
    
    //add easy objects to find
    ObjectToFind *object1 = [[ObjectToFind alloc] init];
    object1.image = @"cow.png";
    object1.x = 723;
    object1.y = 222;
    object1.width = 150;
    object1.height = 138;
    [page.objectsToFind addObject:object1];
    
    ObjectToFind *object2 = [[ObjectToFind alloc] init];
    object2.image = @"elephant.png";
    object2.x = 569;
    object2.y = 442;
    object2.width = 126;
    object2.height = 127;
    [page.objectsToFind addObject:object2];
    
    ObjectToFind *object3 = [[ObjectToFind alloc] init];
    object3.image = @"swiss_cheese.png";
    object3.x = 850;
    object3.y = 353;
    object3.width = 86;
    object3.height = 84;
    [page.objectsToFind addObject:object3];
    
    ObjectToFind *object4 = [[ObjectToFind alloc] init];
    object4.image = @"tigerbutt.png";
    object4.x = 811;
    object4.y = 0;
    object4.width = 213;
    object4.height = 202;
    [page.objectsToFind addObject:object4];
    
    ObjectToFind *object5 = [[ObjectToFind alloc] init];
    object5.image = @"toothpaste.png";
    object5.x = 247;
    object5.y = 136;
    object5.width = 111;
    object5.height = 112;
    [page.objectsToFind addObject:object5];
    
    ObjectToFind *object6 = [[ObjectToFind alloc] init];
    object6.image = @"whale.png";
    object6.x = 490;
    object6.y = 244;
    object6.width = 145;
    object6.height = 167;
    [page.objectsToFind addObject:object6];
    
    ObjectToFind *object7 = [[ObjectToFind alloc] init];
    object7.image = @"fries.png";
    object7.x = 348;
    object7.y = 494;
    object7.width = 107;
    object7.height = 99;
    [page.objectsToFind addObject:object7];
    
    ObjectToFind *object8 = [[ObjectToFind alloc] init];
    object8.image = @"meteor.png";
    object8.x = 276;
    object8.y = 244;
    object8.width = 160;
    object8.height = 145;
    [page.objectsToFind addObject:object8];
    
    ObjectToFind *object9 = [[ObjectToFind alloc] init];
    object9.image = @"rabbit.png";
    object9.x = 0;
    object9.y = 286;
    object9.width = 286;
    object9.height = 307;
    [page.objectsToFind addObject:object9];
    
    ObjectToFind *object10 = [[ObjectToFind alloc] init];
    object10.image = @"rocket.png";
    object10.x = 204;
    object10.y = 0;
    object10.width = 174;
    object10.height = 117;
    [page.objectsToFind addObject:object10];
    
    return page;
}

- (NSMutableArray *)getChapterPictures:(int)index {
    NSMutableArray *subsetOfChapterPictures;
    subsetOfChapterPictures = [[NSMutableArray alloc]init];
    
    chapterPictures = [[NSMutableArray alloc]init];
    
    [chapterPictures addObject:@"IntroPage.png"];
    [chapterPictures addObject:@"timetravel.png"];
    [chapterPictures addObject:@"Space_FinalDrawing.png"];
    [chapterPictures addObject:@"DinoPage2.png"];
    [chapterPictures addObject:@"Space_FinalDrawing.png"];
    [chapterPictures addObject:@"timetravel.png"];
    [chapterPictures addObject:@"FinalPage.png"];
    
    if(index == 0) {
        //return first 6
        for (int i = 0; i < 6; i++) {
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setObject:[NSNumber numberWithInteger:i] forKey:@"index"];
            [dict setObject:[chapterPictures objectAtIndex:i] forKey:@"image"];
            
            [subsetOfChapterPictures addObject:dict];
        }
    }
    else if(index == ([self getNumberOfChapterPages] - 1)) {
        int remainder = [self getNumberOfPages] - (([self getNumberOfPages]/6)*6);
        for (int i = ([self getNumberOfPages] - remainder); i < [self getNumberOfPages]; i++) {
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setObject:[NSNumber numberWithInteger:i] forKey:@"index"];
            [dict setObject:[chapterPictures objectAtIndex:i] forKey:@"image"];
            
            [subsetOfChapterPictures addObject:dict];
        }
    }
    else {
        //TODO:
        //return given 6 based on index
        [NSException raise:@"No logic for given index to get chapters" format:@"No logic for given index to get chapters"];
    }
    
    return subsetOfChapterPictures;
}

@end
