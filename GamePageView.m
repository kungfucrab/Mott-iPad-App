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
bool isHard = false;

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
- (ObjectToFind *)getDataObject:(int) imageID {
    if([objectsToFind count] < 4 && imageID == 1) {
        objectsToFind = [NSMutableArray arrayWithArray:self.pageData.objectsToFind];
    }
    
    int index = rand() % [objectsToFind count];
    ObjectToFind *gameObject = [objectsToFind objectAtIndex:index];
    [objectsToFind removeObjectAtIndex:index];
    
    return gameObject;
}

- (void) setupNewGameObject:(int)index {
    ObjectToFind *object = [self getDataObject:index];
    
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

-(IBAction)easyButton:(id)sender {
    isHard = false;
    [self gameReset];
}

-(IBAction)hardButton:(id)sender {
    isHard = true;
    [self startHardMode];
}
//****************************************************************************
//******************************Hard Mode Functions***************************
//****************************************************************************
-(void)startHardMode {
    
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
//****************************************************************************
//*****************************Grayscale Object*******************************
//****************************************************************************
- (UIImage *)convertToGreyscale:(UIImage *)i
{
    int kRed = 1;
    int kGreen = 2;
    int kBlue = 4;
    
    int colors = kGreen;
    int m_width = i.size.width;
    int m_height = i.size.height;
    
    uint32_t *rgbImage = (uint32_t *) malloc(m_width * m_height * sizeof(uint32_t));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImage, m_width, m_height, 8, m_width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, m_width, m_height), [i CGImage]);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // now convert to grayscale
    uint8_t *m_imageData = (uint8_t *) malloc(m_width * m_height);
    uint8_t *alphaData = (uint8_t *) malloc(m_width*m_height);
    
    for(int y = 0; y < m_height; y++) {
        for(int x = 0; x < m_width; x++) {
            uint32_t rgbPixel=rgbImage[y*m_width+x];
            uint32_t sum=0,count=0;
            if (colors & kRed) {sum += (rgbPixel>>24)&255; count++;}
            if (colors & kGreen) {sum += (rgbPixel>>16)&255; count++;}
            if (colors & kBlue) {sum += (rgbPixel>>8)&255; count++;}
            alphaData[y*m_width+x] = rgbPixel>>0 & 255;
            m_imageData[y*m_width+x]=sum/count;
        }
    }
    free(rgbImage);
    
    // convert from a gray scale image back into a UIImage
    uint8_t *result = (uint8_t *) calloc(m_width * m_height *sizeof(uint32_t), 1);
    
    // process the image back to rgb
    for(int i = 0; i < m_height * m_width; i++) {
        //Copying Aplha value
        result[i*4] = alphaData[i];
        int val=m_imageData[i];
        result[i*4+1]=val;
        result[i*4+2]=val;
        result[i*4+3]=val;
    }
    
    // create a UIImage
    colorSpace = CGColorSpaceCreateDeviceRGB();
    context = CGBitmapContextCreate(result, m_width, m_height, 8, m_width * sizeof(uint32_t), colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    CGImageRef image = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    CGImageRelease(image);
    
    free(m_imageData);
    free(alphaData);
    // make sure the data will be released by giving it to an autoreleased NSData
    [NSData dataWithBytesNoCopy:result length:m_width * m_height];
    
    return resultUIImage;
}
@end
