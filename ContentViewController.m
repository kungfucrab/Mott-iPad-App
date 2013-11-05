//
//  ContentViewController.m
//  PageApp
//
//  Created by Sebastian Martinez on 9/30/13.
//  Copyright (c) 2013 PageApp. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

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
    
    self.view.backgroundColor = [UIColor greenColor];
    [_webView loadHTMLString:_dataObject
                     baseURL:[NSURL URLWithString:@""]];
}

//viewwillappear seems to overwrite this
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor greenColor];
    [_webView loadHTMLString:@"yahoo"
                     baseURL:[NSURL URLWithString:@""]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
