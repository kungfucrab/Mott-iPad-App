//
//  ChaptersView.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 12/7/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "ChaptersView.h"

@interface ChaptersView ()

@end

@implementation ChaptersView

@synthesize chapter1View, chapter2View, chapter3View, chapter4View, chapter5View, chapter6View;

NSMutableArray *chapterPictures;

//Do not think i need this below fucntion
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//seems to overwrite viewDidLoad
//here is where we will use the index given by _dataObject to
//pass to our function that will then return the given page data
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.helper = [[PageContentHelper alloc] init];
    chapterPictures = [[NSMutableArray alloc]init];

    int index = [self.dataObject integerValue];
    chapterPictures = [self.helper getChapterPictures:index];

    NSLog(@"%d", [chapterPictures count]);

    [self populateChapters];
}

- (void)populateChapters {
    chapter1View.contentMode = UIViewContentModeScaleAspectFit;
    chapter2View.contentMode = UIViewContentModeScaleAspectFit;
    chapter3View.contentMode = UIViewContentModeScaleAspectFit;
    chapter4View.contentMode = UIViewContentModeScaleAspectFit;
    chapter5View.contentMode = UIViewContentModeScaleAspectFit;
    chapter6View.contentMode = UIViewContentModeScaleAspectFit;
    
    @try {
        UIImage *image = [UIImage imageNamed: [[chapterPictures objectAtIndex:0] objectForKey:@"image"]];
        [chapter1View setImage:image];
        
        image = [UIImage imageNamed: [[chapterPictures objectAtIndex:1] objectForKey:@"image"]];
        [chapter2View setImage:image];
        
        image = [UIImage imageNamed: [[chapterPictures objectAtIndex:2] objectForKey:@"image"]];
        [chapter3View setImage:image];
        
        image = [UIImage imageNamed: [[chapterPictures objectAtIndex:3] objectForKey:@"image"]];
        [chapter4View setImage:image];
        
        image = [UIImage imageNamed: [[chapterPictures objectAtIndex:4] objectForKey:@"image"]];
        [chapter5View setImage:image];
        
        image = [UIImage imageNamed: [[chapterPictures objectAtIndex:5] objectForKey:@"image"]];
        [chapter6View setImage:image];
    }
    @catch (NSException *exception) {
        NSLog(@"Did not populate all 6 but its ok");
    }
}

-(IBAction)button1:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = [[[chapterPictures objectAtIndex:0] objectForKey:@"index"] integerValue];
}

-(IBAction)button2:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = [[[chapterPictures objectAtIndex:1] objectForKey:@"index"] integerValue];
}

-(IBAction)button3:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = [[[chapterPictures objectAtIndex:2] objectForKey:@"index"] integerValue];
}

-(IBAction)button4:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = [[[chapterPictures objectAtIndex:3] objectForKey:@"index"] integerValue];
}

-(IBAction)button5:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = [[[chapterPictures objectAtIndex:4] objectForKey:@"index"] integerValue];
}

-(IBAction)button6:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = [[[chapterPictures objectAtIndex:5] objectForKey:@"index"] integerValue];
}

//viewwillappear seems to overwrite this
- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
