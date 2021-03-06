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
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *livesLabel;
    IBOutlet UILabel *timerLabel;
    IBOutlet UILabel *scoreVarLabel;
    IBOutlet UILabel *livesVarLabel;
    IBOutlet UILabel *timerVarLabel;
    
    IBOutlet UILabel *Image1Box1;
    IBOutlet UILabel *Image1Box2;
    IBOutlet UILabel *Image1Box3;
    IBOutlet UILabel *Image1Box4;
    
    IBOutlet UILabel *Image2Box1;
    IBOutlet UILabel *Image2Box2;
    IBOutlet UILabel *Image2Box3;
    IBOutlet UILabel *Image2Box4;

    IBOutlet UILabel *Image3Box1;
    IBOutlet UILabel *Image3Box2;
    IBOutlet UILabel *Image3Box3;
    IBOutlet UILabel *Image3Box4;

    
    NSMutableArray *objectsToFind;
    
    NSMutableArray *object1Squares;
    NSMutableArray *object2Squares;
    NSMutableArray *object3Squares;
}

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) SearchGamePage *pageData;
@property(strong, nonatomic) UIImageView *entireImageView;
@property(strong, nonatomic) UIImageView *findObject1View;
@property(strong, nonatomic) UIImageView *findObject2View;
@property(strong, nonatomic) UIImageView *findObject3View;
@property(strong, nonatomic) NSMutableArray *objectsToFind;

@property(strong, nonatomic) UILabel *scoreLabel;
@property(strong, nonatomic) UILabel *livesLabel;
@property(strong, nonatomic) UILabel *timerLabel;
@property(strong, nonatomic) UILabel *scoreVarLabel;
@property(strong, nonatomic) UILabel *livesVarLabel;
@property(strong, nonatomic) UILabel *timerVarLabel;

@property(strong, nonatomic) UILabel *Image1Box1;
@property(strong, nonatomic) UILabel *Image1Box2;
@property(strong, nonatomic) UILabel *Image1Box3;
@property(strong, nonatomic) UILabel *Image1Box4;

@property(strong, nonatomic) UILabel *Image2Box1;
@property(strong, nonatomic) UILabel *Image2Box2;
@property(strong, nonatomic) UILabel *Image2Box3;
@property(strong, nonatomic) UILabel *Image2Box4;

@property(strong, nonatomic) UILabel *Image3Box1;
@property(strong, nonatomic) UILabel *Image3Box2;
@property(strong, nonatomic) UILabel *Image3Box3;
@property(strong, nonatomic) UILabel *Image3Box4;

@property(strong, nonatomic) NSMutableArray *object1Squares;
@property(strong, nonatomic) NSMutableArray *object2Squares;
@property(strong, nonatomic) NSMutableArray *object3Squares;

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
