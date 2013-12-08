//
//  ChaptersView.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 12/7/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentHelper.h"
#import "HomeAppDelegate.h"

@interface ChaptersView : UIViewController {
    IBOutlet UIImageView *chapter1View;
    IBOutlet UIImageView *chapter2View;
    IBOutlet UIImageView *chapter3View;
    IBOutlet UIImageView *chapter4View;
    IBOutlet UIImageView *chapter5View;
    IBOutlet UIImageView *chapter6View;
}

@property (strong, nonatomic) id dataObject;
@property(strong, nonatomic) PageContentHelper *helper;

@property(strong, nonatomic) UIImageView *chapter1View;
@property(strong, nonatomic) UIImageView *chapter2View;
@property(strong, nonatomic) UIImageView *chapter3View;
@property(strong, nonatomic) UIImageView *chapter4View;
@property(strong, nonatomic) UIImageView *chapter5View;
@property(strong, nonatomic) UIImageView *chapter6View;

- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;
- (IBAction)button6:(id)sender;

@end
