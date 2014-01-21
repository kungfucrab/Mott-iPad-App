//
//  GamePageView.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/10/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "GamePageView.h"

@interface GamePageView ()

@end

@implementation GamePageView

@synthesize entireImageView, findObject1View, findObject2View, findObject3View, objectsToFind;

int objectsFoundCount = 0;
UIButton *findObjectButton1, *findObjectButton2, *findObjectButton3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //entireImageView.contentMode = UIViewContentModeScaleAspectFit;
    findObject1View.contentMode = UIViewContentModeScaleAspectFit;
    findObject2View.contentMode = UIViewContentModeScaleAspectFit;
    findObject3View.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *image = [UIImage imageNamed: self.pageData.image];
    [entireImageView setImage:image];
    
    objectsToFind = [[NSMutableArray alloc] init];
    objectsToFind = [NSMutableArray arrayWithArray:self.pageData.objectsToFind];
    
    [self gameReset];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//****************************************************************************
//***************************Game Logic Functions*****************************
//****************************************************************************
- (NSMutableArray *)getDataObject {
    NSMutableArray *findObjects = [[NSMutableArray alloc] init];
    
    if([objectsToFind count] == 0) {
        objectsToFind = [NSMutableArray arrayWithArray:self.pageData.objectsToFind];
    }
    
    for (int i = 0; i < 1; i++) {
        int index = rand() % [objectsToFind count];
        [findObjects addObject:[objectsToFind objectAtIndex:index]];
        [objectsToFind removeObjectAtIndex:index];
    }
    
    return findObjects;
}

- (void) setupNewGameObject:(int)index {
    NSMutableArray *findObjectsData = [[NSMutableArray alloc] init];
    findObjectsData = [NSMutableArray arrayWithArray:[self getDataObject]];
    
    ObjectToFind *object = [findObjectsData objectAtIndex:0];
    
    UIImage *image;
    CGRect frame;
    
    if (index == 1) {
        image = [UIImage imageNamed:object.image];
        [findObject1View setImage:image];
        
        frame = CGRectMake(object.x, object.y, object.width, object.height);
        findObjectButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        findObjectButton1.frame = frame;
        [findObjectButton1 setTitle: NULL forState:UIControlStateNormal];
        findObjectButton1.backgroundColor = [UIColor clearColor];
        findObjectButton1.tag =2000;
        [findObjectButton1 addTarget:self action:@selector(findObject1ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:findObjectButton1];
    }
    else if (index == 2) {
        image = [UIImage imageNamed:object.image];
        [findObject2View setImage:image];
        
        frame = CGRectMake(object.x, object.y, object.width, object.height);
        findObjectButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        findObjectButton2.frame = frame;
        [findObjectButton2 setTitle: NULL forState:UIControlStateNormal];
        findObjectButton2.backgroundColor = [UIColor clearColor];
        findObjectButton2.tag =2000;
        [findObjectButton2 addTarget:self action:@selector(findObject2ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:findObjectButton2];

    }
    else if (index == 3) {
        image = [UIImage imageNamed:object.image];
        [findObject3View setImage:image];
        
        frame = CGRectMake(object.x, object.y, object.width, object.height);
        findObjectButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        findObjectButton3.frame = frame;
        [findObjectButton3 setTitle: NULL forState:UIControlStateNormal];
        findObjectButton3.backgroundColor = [UIColor clearColor];
        findObjectButton3.tag =2000;
        [findObjectButton3 addTarget:self action:@selector(findObject3ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:findObjectButton3];
    }
}

- (void) gameReset {
    [findObjectButton1 removeFromSuperview];
    [findObjectButton2 removeFromSuperview];
    [findObjectButton3 removeFromSuperview];
    
    findObject1View.image = nil;
    findObject2View.image = nil;
    findObject3View.image = nil;
    
    objectsFoundCount = 0;
    
    [self setupNewGameObject:1];
    [self setupNewGameObject:2];
    [self setupNewGameObject:3];
}

-(IBAction)resetButton:(id)sender {
    [self gameReset];
}
//****************************************************************************
//***************Button Actions for Objects to Find in Illustration***********
//****************************************************************************
- (IBAction)findObject1ButtonAction:(id)sender {
    objectsFoundCount++;
    [findObjectButton1 removeFromSuperview];
    findObject1View.image = nil;
    
    if (objectsFoundCount == 3) {
        [self gameReset];
    }
}

- (IBAction)findObject2ButtonAction:(id)sender {
    objectsFoundCount++;
    [findObjectButton2 removeFromSuperview];
    findObject2View.image = nil;
    
    if (objectsFoundCount == 3) {
        [self gameReset];
    }
}

- (IBAction)findObject3ButtonAction:(id)sender {
    objectsFoundCount++;
    [findObjectButton3 removeFromSuperview];
    findObject3View.image = nil;
    
    if (objectsFoundCount == 3) {
        [self gameReset];
    }
}

@end
