//
//  HomeViewController.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 10/4/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)storyButton:(id)sender {
    HomeAppDelegate *data = (HomeAppDelegate *)[[UIApplication sharedApplication] delegate];
    data.pageIndex = 0;
}

@end
