//
//  PageAppViewController.h
//  PageApp
//
//  Created by Sebastian Martinez on 9/30/13.
//  Copyright (c) 2013 PageApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"
#import "BluePage.h"
#import "PageContentHelper.h"

@interface PageAppViewController : UIViewController
<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;
@property(strong, nonatomic) PageContentHelper *helper;
@end
