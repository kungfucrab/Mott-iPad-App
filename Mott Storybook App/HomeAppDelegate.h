//
//  HomeAppDelegate.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/4/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeAppDelegate : UIResponder <UIApplicationDelegate> {
    NSInteger pageIndex;
    NSInteger boolValue;
}

@property (strong, nonatomic) UIWindow *window;

@property(assign) NSInteger pageIndex;
@property(assign) NSInteger boolValue;

@end
