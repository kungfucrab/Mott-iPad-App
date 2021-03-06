//
//  chapters.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 12/7/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "chapters.h"

@interface chapters ()

@end

@implementation chapters


- (ChaptersView *)viewControllerAtIndex:(NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) ||
        (index >= [self.pageContent count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    ChaptersView *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"ChaptersView"];
    
    dataViewController.dataObject = _pageContent[index];
    
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(ChaptersView *)viewController
{
    return [_pageContent indexOfObject:viewController.dataObject];
}

//loads the content into the array we will iterate over
//in our case just use int indexs to be passed into a funciton that will call the data we need
- (void) createContentPages
{
    NSMutableArray *chapters = [[NSMutableArray alloc] init];
    
    int a = [self.helper getNumberOfChapterPages];
    
    for (int i =0; i < a; i++) {
        NSString *intString = [NSString stringWithFormat:@"%d", i];
        [chapters addObject:intString];
    }
    
    _pageContent = [[NSArray alloc] initWithArray:chapters];
}

//preps previous page
- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController: (UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
                        (ChaptersView *)viewController];
    
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
    NSUInteger index = [self indexOfViewController: (ChaptersView *)viewController];
    
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
    self.helper = [[PageContentHelper alloc] init];
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
    ChaptersView *initialViewController = [self viewControllerAtIndex:0];
    
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
