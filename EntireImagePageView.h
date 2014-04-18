//
//  EntireImagePageView.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/10/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullImagePage.h"

@interface EntireImagePageView : UIViewController {
    IBOutlet UIImageView *entireImageView;
    
    IBOutlet UIButton *button1Image;
    IBOutlet UIButton *button2Image;
    IBOutlet UIButton *button3Image;
    IBOutlet UIButton *button4Image;
    IBOutlet UIButton *button5Image;
    IBOutlet UIButton *button6Image;
    IBOutlet UIButton *button7Image;
    IBOutlet UIButton *button8Image;
}

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) FullImagePage *pageData;

@property(nonatomic, retain) UIButton *button1Image;
@property(nonatomic, retain) UIButton *button2Image;
@property(nonatomic, retain) UIButton *button3Image;
@property(nonatomic, retain) UIButton *button4Image;
@property(nonatomic, retain) UIButton *button5Image;
@property(nonatomic, retain) UIButton *button6Image;
@property(nonatomic, retain) UIButton *button7Image;
@property(nonatomic, retain) UIButton *button8Image;

-(IBAction)button1:(id)sender;
-(IBAction)button2:(id)sender;
-(IBAction)button3:(id)sender;
-(IBAction)button4:(id)sender;
-(IBAction)button5:(id)sender;
-(IBAction)button6:(id)sender;
-(IBAction)button7:(id)sender;
-(IBAction)button8:(id)sender;

@end
