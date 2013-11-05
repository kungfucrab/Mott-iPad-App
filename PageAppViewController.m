//
//  PageAppViewController.m
//  PageApp
//
//  Created by Sebastian Martinez on 9/30/13.
//  Copyright (c) 2013 PageApp. All rights reserved.
//

#import "PageAppViewController.h"

@interface PageAppViewController ()

@end

@implementation PageAppViewController

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) ||
            (index >= [self.pageContent count])) {
        return nil;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    if (index == 2) {
        BluePage *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"BluePage"];
        dataViewController.dataObject = _pageContent[index];
        return ((UIViewController*)dataViewController);
    }
    else {
        ContentViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"contentView"];
        dataViewController.dataObject = _pageContent[index];
        return ((UIViewController*)dataViewController);
    }
}

//loads the content into the array we will iterate over
//in our case just use int indexs to be passed into a funciton that will call the data we need
- (void) createContentPages
{
    NSMutableArray *websites = [[NSMutableArray alloc] init];
    
    [websites addObject:@"walrus"];
    [websites addObject:@"dogs"];
    [websites addObject:@"legos"];
    [websites addObject:@"snakes"];
    [websites addObject:@"more stuff"];
    
    _pageContent = [[NSArray alloc] initWithArray:websites];
}

//preps previous page
- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController: (UIViewController *)viewController
{
    NSUInteger index = [_pageContent indexOfObject:((ContentViewController *)viewController).dataObject];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

//preps following page
- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [_pageContent indexOfObject:((ContentViewController *)viewController).dataObject];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    if (index == [self.pageContent count]) {
        return nil; }
    
    return [self viewControllerAtIndex:index];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    
    //calls the data function to create the array we will use to popualte the book
    [self createContentPages];
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]forKey:
                             UIPageViewControllerOptionSpineLocationKey];
    
    _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:
                       UIPageViewControllerNavigationOrientationHorizontal options: options];

    _pageController.dataSource = self;
    
    [[_pageController view] setFrame:[[self view] bounds]];
    
    //Index that it will initially start at, use this for chapters and set with a variable of some sort
    //this also sets up the current page we are planning to look at
    UIViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [_pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:_pageController];
    
    [[self view] addSubview:[_pageController view]];
    
    [_pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
