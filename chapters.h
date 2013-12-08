//
//  chapters.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 12/7/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChaptersView.h"
#import "PageContentHelper.h"

@interface chapters : UIViewController
<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;
@property(strong, nonatomic) PageContentHelper *helper;
@end
