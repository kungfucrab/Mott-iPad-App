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

@synthesize entireImageView, findObject1View, findObject2View, findObject3View,
objectsToFind, object1Squares, object2Squares, object3Squares,
scoreLabel, livesLabel, timerLabel, scoreVarLabel, livesVarLabel, timerVarLabel;

@synthesize Image1Box1, Image1Box2, Image1Box3, Image1Box4;
@synthesize Image2Box1, Image2Box2, Image2Box3, Image2Box4;
@synthesize Image3Box1, Image3Box2, Image3Box3, Image3Box4;

int objectsFoundCount = 0;
UIButton *findObjectButton1, *findObjectButton2, *findObjectButton3;
bool isHard = false;
bool startedHardGame = false;

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
    ////////////////TESTING///////////////////////////////////
//    Image1Box1.backgroundColor = [UIColor clearColor];
//    Image1Box2.backgroundColor = [UIColor clearColor];
//    Image1Box3.backgroundColor = [UIColor clearColor];
//    Image1Box4.backgroundColor = [UIColor clearColor];
//    
//    Image2Box1.backgroundColor = [UIColor clearColor];
//    Image2Box2.backgroundColor = [UIColor clearColor];
//    Image2Box3.backgroundColor = [UIColor clearColor];
//    Image2Box4.backgroundColor = [UIColor clearColor];
//    
//    Image3Box1.backgroundColor = [UIColor clearColor];
//    Image3Box2.backgroundColor = [UIColor clearColor];
//    Image3Box3.backgroundColor = [UIColor clearColor];
//    Image3Box4.backgroundColor = [UIColor clearColor];
    ///////////////////////////////////////////////////////////////
    [super viewWillAppear:animated];
    
    objectsFoundCount = 0;
    isHard = false;
    startedHardGame = false;
    
    //entireImageView.contentMode = UIViewContentModeScaleAspectFit;
    findObject1View.contentMode = UIViewContentModeScaleAspectFit;
    findObject2View.contentMode = UIViewContentModeScaleAspectFit;
    findObject3View.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *image = [UIImage imageNamed: self.pageData.image];
    [entireImageView setImage:image];
    
    objectsToFind = [[NSMutableArray alloc] init];
    objectsToFind = [NSMutableArray arrayWithArray:self.pageData.objectsToFind];
    
    object1Squares = [[NSMutableArray alloc] init];
    object2Squares = [[NSMutableArray alloc] init];
    object3Squares = [[NSMutableArray alloc] init];
    
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
    
    image = [UIImage imageNamed:object.image];
    if (isHard == true) {
        image = [self convertToGreyscale:image];
    }
    
    if (index == 1) {
        [findObject1View setImage:image];
        
        frame = CGRectMake(object.x, object.y, object.width, object.height);
        findObjectButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        findObjectButton1.frame = frame;
        [findObjectButton1 setTitle: NULL forState:UIControlStateNormal];
        findObjectButton1.backgroundColor = [UIColor clearColor];
        findObjectButton1.tag =2000;
        
        if (isHard == true) {
            [findObjectButton1 addTarget:self action:@selector(findObject1ButtonActionHard:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (isHard == false) {
            [findObjectButton1 addTarget:self action:@selector(findObject1ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self.view addSubview:findObjectButton1];
    }
    else if (index == 2) {
        [findObject2View setImage:image];
        
        frame = CGRectMake(object.x, object.y, object.width, object.height);
        findObjectButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        findObjectButton2.frame = frame;
        [findObjectButton2 setTitle: NULL forState:UIControlStateNormal];
        findObjectButton2.backgroundColor = [UIColor clearColor];
        findObjectButton2.tag =2000;
        
        if (isHard == true) {
            [findObjectButton2 addTarget:self action:@selector(findObject2ButtonActionHard:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (isHard == false) {
            [findObjectButton2 addTarget:self action:@selector(findObject2ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
            
        [self.view addSubview:findObjectButton2];

    }
    else if (index == 3) {
        [findObject3View setImage:image];
        
        frame = CGRectMake(object.x, object.y, object.width, object.height);
        findObjectButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        findObjectButton3.frame = frame;
        [findObjectButton3 setTitle: NULL forState:UIControlStateNormal];
        findObjectButton3.backgroundColor = [UIColor clearColor];
        findObjectButton3.tag =2000;
        
        if (isHard == true) {
            [findObjectButton3 addTarget:self action:@selector(findObject3ButtonActionHard:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (isHard == false) {
            [findObjectButton3 addTarget:self action:@selector(findObject3ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self.view addSubview:findObjectButton3];
    }
}

- (void) gameReset {
    isHard = false;
    
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
NSTimer *timer1;
NSTimer *timer2;
NSTimer *timer3;
NSTimer *gameTimer;

int gameObject1tick;
int gameObject2tick;
int gameObject3tick;
int gameTick;

int score;
int lives;

-(void)startHardMode {
    if (startedHardGame == false) {
        startedHardGame = true;
        [self endHardMode];
        [self createBigButton];
        
        isHard = true;
        score = 0;
        lives = 6;
        
        gameObject1tick = 6;
        gameObject2tick = 6;
        gameObject3tick = 6;
        [self createHardGameObject:timer1 :1 :234242];
        [self createHardGameObject:timer2 :2 :344342];
        [self createHardGameObject:timer3 :3 :129223];
        
        //setup "god" timer
        gameTick = 35;
        
        timerVarLabel.text = [NSString stringWithFormat:@"%d",gameTick];
        scoreVarLabel.text = [NSString stringWithFormat:@"%d",score];
        livesVarLabel.text = [NSString stringWithFormat:@"%d",lives];
        
        gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                                   selector:@selector(hardModeTicker) userInfo:nil repeats:YES];
    }
}

-(void)createHardGameObject:(NSTimer *)timer :(int)objectID :(int)arrayOfBoxes {
    [self setupNewGameObject:objectID];
    
    NSMutableDictionary *gameObjectDict = [[NSMutableDictionary alloc] init];
    [gameObjectDict setObject:[NSNumber numberWithInteger:objectID] forKey:@"objectID"];
    //add array of associated squares to remove later in tick
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                           selector:@selector(gameObjectTicker:) userInfo:gameObjectDict repeats:YES];
}

- (IBAction)losePointsButtonAction:(id)sender {
    [self subtractPoint];
    [self subtractLife];
}

- (void)endHardMode {
    timerVarLabel.text = @"0";
    livesVarLabel.text = @"0";
    
    [timer1 invalidate];
    [timer2 invalidate];
    [timer3 invalidate];
    
    [findObjectButton1 removeFromSuperview];
    [findObjectButton2 removeFromSuperview];
    [findObjectButton3 removeFromSuperview];
    
    findObject1View.image = nil;
    findObject2View.image = nil;
    findObject3View.image = nil;
}

- (void)createBigButton {
    
}

- (void)subtractLife {
    lives--;
    livesVarLabel.text = [NSString stringWithFormat:@"%d",lives];
}

- (void)subtractPoint {
    score--;
    scoreVarLabel.text = [NSString stringWithFormat:@"%d",score];
}

-(void)addPoint {
    score = score + 3;
    scoreVarLabel.text = [NSString stringWithFormat:@"%d",score];
}

- (void)hardModeTicker {
    if (gameTick == 0 || lives == 0) {
        [gameTimer invalidate];
        [self endHardMode];
        [self gameReset];
    }
    else {
        gameTick--;
        timerVarLabel.text = [NSString stringWithFormat:@"%d",gameTick];
    }
}

- (void)gameObjectTicker:(NSTimer*)timer {
    if(isHard == true) {
        int objectID = [[[timer userInfo] objectForKey:@"objectID"] integerValue];
        //get the array of associated squares
        
        int tick = 0;
        
        if (objectID == 1) {
            tick = gameObject1tick;
        }
        else if(objectID == 2) {
            tick = gameObject2tick;
        }
        else if(objectID == 3) {
            tick = gameObject3tick ;
        }

        if (tick == 0) {
            [timer invalidate];
            [self subtractLife];
            [self subtractPoint];
            
            if(objectID == 1) {
                [self deleteAndCreateHardObject1];
            }
            else if(objectID ==2) {
                [self deleteAndCreateHardObject2];
            }
            else if(objectID == 3) {
                [self deleteAndCreateHardObject3];
            }
        }
        else {
            if (objectID == 1) {
                gameObject1tick--;
            }
            else if(objectID == 2) {
                gameObject2tick--;
            }
            else if(objectID == 3) {
                gameObject3tick--;
            }
            //remove a square from the array of associated squares
        }
    }
}

- (IBAction)findObject1ButtonActionHard:(id)sender {
    [self addPoint];
    [self deleteAndCreateHardObject1];
}

- (IBAction)findObject2ButtonActionHard:(id)sender {
    [self addPoint];
    [self deleteAndCreateHardObject2];
}

- (IBAction)findObject3ButtonActionHard:(id)sender {
    [self addPoint];
    [self deleteAndCreateHardObject3];
}

- (void) deleteAndCreateHardObject1 {
    [findObjectButton1 removeFromSuperview];
    findObject1View.image = nil;
    gameObject1tick = 6;
    [timer1 invalidate];
    [self createHardGameObject:timer1 :1 :234242];
}

- (void) deleteAndCreateHardObject2 {
    [findObjectButton2 removeFromSuperview];
    findObject2View.image = nil;
    gameObject2tick = 6;
    [timer2 invalidate];
    [self createHardGameObject:timer2 :2 :344342];
}

- (void) deleteAndCreateHardObject3 {
    [findObjectButton3 removeFromSuperview];
    findObject3View.image = nil;
    gameObject3tick = 6;
    [timer3 invalidate];
    [self createHardGameObject:timer3 :3 :129223];
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
