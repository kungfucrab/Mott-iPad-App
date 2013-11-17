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
}

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) FullImagePage *pageData;
@property (strong, nonatomic) UIImageView *entireImageView;

@end
