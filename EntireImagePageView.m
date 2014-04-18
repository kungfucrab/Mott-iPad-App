//
//  EntireImagePageView.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/10/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "EntireImagePageView.h"

@interface EntireImagePageView ()

@end

@implementation EntireImagePageView

@synthesize button1Image, button2Image, button3Image, button4Image, button5Image, button6Image, button7Image, button8Image;

bool prevSelected;
int prevIndex;
int nextIndex;
int matchesFound;

bool button1Pressed, button2Pressed, button3Pressed, button4Pressed, button5Pressed, button6Pressed, button7Pressed, button8Pressed, timeDelay;

NSMutableArray *matchIntArray;

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
    
    matchIntArray = [[NSMutableArray alloc] init];
    
    [matchIntArray addObject:@"2"];
    [matchIntArray addObject:@"1"];
    [matchIntArray addObject:@"3"];
    [matchIntArray addObject:@"3"];
    [matchIntArray addObject:@"2"];
    [matchIntArray addObject:@"1"];
    [matchIntArray addObject:@"4"];
    [matchIntArray addObject:@"4"];
    
    matchesFound = 0;
    prevSelected = false;
    prevIndex = -1;
    nextIndex = -1;
    
    button1Pressed = false;
    button2Pressed = false;
    button3Pressed = false;
    button4Pressed = false;
    button5Pressed = false;
    button6Pressed = false;
    button7Pressed = false;
    button8Pressed = false;
    
    timeDelay = false;
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

- (void) checkMatch {
    timeDelay = false;
    NSString *val1 = [matchIntArray objectAtIndex: prevIndex];
    NSString *val2 = [matchIntArray objectAtIndex: nextIndex];
    
    if([val1 isEqualToString:val2]) {
        NSLog(@"-------------Valid Match Found---------");
        matchesFound++;
        
        if(prevIndex == 0 || nextIndex == 0) {
            [button1Image setTitle:@"" forState:UIControlStateNormal];
            button1Image.enabled = NO;
        }
        if(prevIndex == 1 || nextIndex == 1) {
            [button2Image setTitle:@"" forState:UIControlStateNormal];
            button2Image.enabled = NO;
        }
        if(prevIndex == 2 || nextIndex == 2) {
            [button3Image setTitle:@"" forState:UIControlStateNormal];
            button3Image.enabled = NO;
        }
        if(prevIndex == 3 || nextIndex == 3) {
            [button4Image setTitle:@"" forState:UIControlStateNormal];
            button4Image.enabled = NO;
        }
        if(prevIndex == 4 || nextIndex == 4) {
            [button5Image setTitle:@"" forState:UIControlStateNormal];
            button5Image.enabled = NO;
        }
        if(prevIndex == 5 || nextIndex == 5) {
            [button6Image setTitle:@"" forState:UIControlStateNormal];
            button6Image.enabled = NO;
        }
        if(prevIndex == 6 || nextIndex == 6) {
            [button7Image setTitle:@"" forState:UIControlStateNormal];
            button7Image.enabled = NO;
        }
        if(prevIndex == 7 || nextIndex == 7) {
            [button8Image setTitle:@"" forState:UIControlStateNormal];
            button8Image.enabled = NO;
        }
    }
    else {
        NSLog(@"-------------Valid Match NOT Found---------");
        [self resetGameMatchFailed];
    }
    
    if (matchesFound == 4) {
        [self resetGameToStart];
    }
    
    prevSelected = false;
    prevIndex = -1;
    nextIndex = -1;
}

- (void) resetGameMatchFailed {
    UIImage *buttonImage = [UIImage imageNamed:@"Card.jpg"];
    if(prevIndex == 0 || nextIndex == 0) {
        [button1Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button1Image setTitle:@"" forState:UIControlStateNormal];
        button1Pressed = false;
    }
    if(prevIndex == 1 || nextIndex == 1) {
        [button2Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button2Image setTitle:@"" forState:UIControlStateNormal];
        button2Pressed = false;
    }
    if(prevIndex == 2 || nextIndex == 2) {
        [button3Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button3Image setTitle:@"" forState:UIControlStateNormal];
        button3Pressed = false;
    }
    if(prevIndex == 3 || nextIndex == 3) {
        [button4Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button4Image setTitle:@"" forState:UIControlStateNormal];
        button4Pressed = false;
    }
    if(prevIndex == 4 || nextIndex == 4) {
        [button5Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button5Image setTitle:@"" forState:UIControlStateNormal];
        button5Pressed = false;
    }
    if(prevIndex == 5 || nextIndex == 5) {
        [button6Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button6Image setTitle:@"" forState:UIControlStateNormal];
        button6Pressed = false;
    }
    if(prevIndex == 6 || nextIndex == 6) {
        [button7Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button7Image setTitle:@"" forState:UIControlStateNormal];
        button7Pressed = false;
    }
    if(prevIndex == 7 || nextIndex == 7) {
        [button8Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [button8Image setTitle:@"" forState:UIControlStateNormal];
        button8Pressed = false;
    }
}

- (void) resetGameToStart {
    NSLog(@"-------------resetGameToStart---------");
    matchesFound = 0;
    UIImage *buttonImage = [UIImage imageNamed:@"Card.jpg"];
    
    [button1Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button1Image setTitle:@"" forState:UIControlStateNormal];
    button1Pressed = false;
    button1Image.enabled = YES;

    [button2Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button2Image setTitle:@"" forState:UIControlStateNormal];
    button2Pressed = false;
    button2Image.enabled = YES;

    [button3Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button3Image setTitle:@"" forState:UIControlStateNormal];
    button3Pressed = false;
    button3Image.enabled = YES;

    [button4Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button4Image setTitle:@"" forState:UIControlStateNormal];
    button4Pressed = false;
    button4Image.enabled = YES;

    [button5Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button5Image setTitle:@"" forState:UIControlStateNormal];
    button5Pressed = false;
    button5Image.enabled = YES;

    [button6Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button6Image setTitle:@"" forState:UIControlStateNormal];
    button6Pressed = false;
    button6Image.enabled = YES;

    [button7Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button7Image setTitle:@"" forState:UIControlStateNormal];
    button7Pressed = false;
    button7Image.enabled = YES;

    [button8Image setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button8Image setTitle:@"" forState:UIControlStateNormal];
    button8Pressed = false;
    button8Image.enabled = YES;
    
    for(int i = 0; i < 8; i++) {
        int index1 = arc4random() % [matchIntArray count];
        int index2 = arc4random() % [matchIntArray count];
        
        NSString *string1 = [matchIntArray objectAtIndex:index1];
        NSString *string2 = [matchIntArray objectAtIndex:index2];
        
        [matchIntArray replaceObjectAtIndex:index2 withObject:string1];
        [matchIntArray replaceObjectAtIndex:index1 withObject:string2];
    }
}

-(IBAction)button1:(id)sender
{
    if(button1Pressed == false && !timeDelay) {
            button1Pressed = true;
            if(prevSelected == false) {
                NSLog(@"-------------Button1 Prevselected == false---------");
                prevIndex = 0;
                prevSelected = true;
                [button1Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button1Image setTitle:[matchIntArray objectAtIndex:0] forState:UIControlStateNormal];
            }
            else {
                NSLog(@"-------------Button1 Prevselected == true---------");
                nextIndex = 0;
                [button1Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button1Image setTitle:[matchIntArray objectAtIndex:0] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

-(IBAction)button2:(id)sender
{
    if(button2Pressed == false && !timeDelay) {
        button2Pressed = true;
            if(prevSelected == false ) {
                NSLog(@"-------------Button2 Prevselected == false---------");
                prevIndex = 1;
                prevSelected = true;
                [button2Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button2Image setTitle:[matchIntArray objectAtIndex:1] forState:UIControlStateNormal];
            }
            else {
                 NSLog(@"-------------Button2 Prevselected == true---------");
                nextIndex = 1;
                [button2Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button2Image setTitle:[matchIntArray objectAtIndex:1] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

-(IBAction)button3:(id)sender
{
    if(button3Pressed == false && !timeDelay) {
        button3Pressed = true;
            if(prevSelected == false ) {
                NSLog(@"-------------Button3 Prevselected == false---------");
                prevIndex = 2;
                prevSelected = true;
                [button3Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button3Image setTitle:[matchIntArray objectAtIndex:2] forState:UIControlStateNormal];
            }
            else {
                NSLog(@"-------------Button3 Prevselected == true---------");
                nextIndex = 2;
                [button3Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button3Image setTitle:[matchIntArray objectAtIndex:2] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

-(IBAction)button4:(id)sender
{
    if(button4Pressed == false && !timeDelay) {
        button4Pressed = true;
            if(prevSelected == false ) {
                NSLog(@"-------------Button4 Prevselected == false---------");
                prevIndex = 3;
                prevSelected = true;
                [button4Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button4Image setTitle:[matchIntArray objectAtIndex:3] forState:UIControlStateNormal];
            }
            else {
                 NSLog(@"-------------Button4 Prevselected == true---------");
                nextIndex = 3;
                [button4Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button4Image setTitle:[matchIntArray objectAtIndex:3] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

-(IBAction)button5:(id)sender
{
    if(button5Pressed == false && !timeDelay) {
        button5Pressed = true;
            if(prevSelected == false ) {
                NSLog(@"-------------Button5 Prevselected == false---------");
                prevIndex = 4;
                prevSelected = true;
                [button5Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button5Image setTitle:[matchIntArray objectAtIndex:4] forState:UIControlStateNormal];
            }
            else {
                NSLog(@"-------------Button5 Prevselected == true---------");
                nextIndex = 4;
                [button5Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button5Image setTitle:[matchIntArray objectAtIndex:4] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

-(IBAction)button6:(id)sender
{
    if(button6Pressed == false && !timeDelay) {
        button6Pressed = true;
            if(prevSelected == false ) {
                NSLog(@"-------------Button6 Prevselected == false---------");
                prevIndex = 5;
                prevSelected = true;
                [button6Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button6Image setTitle:[matchIntArray objectAtIndex:5] forState:UIControlStateNormal];
            }
            else {
                 NSLog(@"-------------Button6 Prevselected == true---------");
                nextIndex = 5;
                [button6Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button6Image setTitle:[matchIntArray objectAtIndex:5] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

-(IBAction)button7:(id)sender
{
    if(button7Pressed == false && !timeDelay) {
        button7Pressed = true;
        if(prevSelected == false ) {
            NSLog(@"-------------Button7 Prevselected == false---------");
            prevIndex = 6;
            prevSelected = true;
            [button7Image setBackgroundImage:nil forState:UIControlStateNormal];
            [button7Image setTitle:[matchIntArray objectAtIndex:6] forState:UIControlStateNormal];
        }
        else {
            nextIndex = 6;
            NSLog(@"-------------Button7 Prevselected == true---------");
            [button7Image setBackgroundImage:nil forState:UIControlStateNormal];
            [button7Image setTitle:[matchIntArray objectAtIndex:6] forState:UIControlStateNormal];
            
            timeDelay = true;
            [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
        }
    }
}

-(IBAction)button8:(id)sender
{
    if(button8Pressed == false && !timeDelay) {
        button8Pressed = true;
            if(prevSelected == false ) {
                NSLog(@"-------------Button8 Prevselected == false---------");
                prevIndex = 7;
                prevSelected = true;
                [button8Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button8Image setTitle:[matchIntArray objectAtIndex:7] forState:UIControlStateNormal];
            }
            else {
                NSLog(@"-------------Button8 Prevselected == true---------");
                nextIndex = 7;
                [button8Image setBackgroundImage:nil forState:UIControlStateNormal];
                [button8Image setTitle:[matchIntArray objectAtIndex:7] forState:UIControlStateNormal];
                
                timeDelay = true;
                [self performSelector:@selector(checkMatch)  withObject:nil afterDelay:1.5];
            }
    }
}

@end
