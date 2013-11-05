//
//  ContentViewController.h
//  PageApp
//
//  Created by Sebastian Martinez on 9/30/13.
//  Copyright (c) 2013 PageApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) id dataObject;
@end
