//
//  CreditUnion.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 12/6/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "CreditUnion.h"

@interface CreditUnion ()

@end

@implementation CreditUnion

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
