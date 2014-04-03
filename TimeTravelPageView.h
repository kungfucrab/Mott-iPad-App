//
//  TimeTravelPageView.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/10/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeTravelPage.h"

@interface TimeTravelPageView : UIViewController {
    IBOutlet UIImageView *entireImageView;
    
    IBOutlet UIImageView *square1_image;
    IBOutlet UIImageView *square2_image;
    IBOutlet UIImageView *square3_image;
    IBOutlet UIImageView *square4_image;
    IBOutlet UIImageView *square5_image;
    IBOutlet UIImageView *square6_image;
    IBOutlet UIImageView *square7_image;
    IBOutlet UIImageView *square8_image;
    IBOutlet UIImageView *square9_image;
}

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) TimeTravelPage *pageData;
@property (strong, nonatomic) UIImageView *entireImageView;

@property (nonatomic, retain) UIImageView *square1_image;
@property (nonatomic, retain) UIImageView *square2_image;
@property (nonatomic, retain) UIImageView *square3_image;
@property (nonatomic, retain) UIImageView *square4_image;
@property (nonatomic, retain) UIImageView *square5_image;
@property (nonatomic, retain) UIImageView *square6_image;
@property (nonatomic, retain) UIImageView *square7_image;
@property (nonatomic, retain) UIImageView *square8_image;
@property (nonatomic, retain) UIImageView *square9_image;

-(IBAction)button1:(id)sender;
-(IBAction)button2:(id)sender;
-(IBAction)button3:(id)sender;
-(IBAction)button4:(id)sender;
-(IBAction)button5:(id)sender;
-(IBAction)button6:(id)sender;
-(IBAction)button7:(id)sender;
-(IBAction)button8:(id)sender;
-(IBAction)button9:(id)sender;

-(IBAction)reset:(id)sender;

@end