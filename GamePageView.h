//
//  GamePageView.h
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/10/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchGamePage.h"
#import "ObjectToFind.h"

@interface GamePageView : UIViewController {
    IBOutlet UIImageView *entireImageView;
    IBOutlet UIImageView *findObject1View;
    IBOutlet UIImageView *findObject2View;
    IBOutlet UIImageView *findObject3View;
    
    NSMutableArray *objectsToFind;
}

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) SearchGamePage *pageData;
@property(strong, nonatomic) UIImageView *entireImageView;
@property(strong, nonatomic) UIImageView *findObject1View;
@property(strong, nonatomic) UIImageView *findObject2View;
@property(strong, nonatomic) UIImageView *findObject3View;
@property(strong, nonatomic) NSMutableArray *objectsToFind;

-(IBAction)findObject1ButtonAction:(id)sender;
-(IBAction)findObject2ButtonAction:(id)sender;
-(IBAction)findObject3ButtonAction:(id)sender;
-(IBAction)easyButton:(id)sender;
-(IBAction)hardButton:(id)sender;

- (IBAction)losePointsButtonAction:(id)sender;
- (IBAction)findObject1ButtonActionHard:(id)sender;
- (IBAction)findObject2ButtonActionHard:(id)sender;
- (IBAction)findObject3ButtonActionHard:(id)sender;

@end
