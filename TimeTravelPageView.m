//
//  TimeTravelPageView.m
//  Mott Storybook App
//
//  Created by Sebastian Martinez on 11/10/13.
//  Copyright (c) 2013 Sebastian Martinez. All rights reserved.
//

#import "TimeTravelPageView.h"

@interface TimeTravelPageView ()

@end

@implementation TimeTravelPageView

@synthesize entireImageView;

@synthesize square1_image, square2_image, square3_image, square4_image, square5_image, square6_image, square7_image, square8_image, square9_image;

//Variable to track if a person Won
bool winner;

//Variable to track if 2-Player or 1-Player
int num_players;

//Variable to Prevent Person from playing when against computer
bool cant_move;

//Variable to Track Current Player, X=1 and O=0
int current_player;

//Varible for Number of Turns
int num_turns;

//Image Variable to Place X or O
UIImage *image;

//Variables to Track if Square Visited or Not
NSString *square1_visited;
NSString *square2_visited;
NSString *square3_visited;
NSString *square4_visited;
NSString *square5_visited;
NSString *square6_visited;
NSString *square7_visited;
NSString *square8_visited;
NSString *square9_visited;

//Variables to Track Square is X or O or nothing
int square1_symbol;
int square2_symbol;
int square3_symbol;
int square4_symbol;
int square5_symbol;
int square6_symbol;
int square7_symbol;
int square8_symbol;
int square9_symbol;

//Fucntion Declarations
void ChangeImage (int CurrentPlayer, int SquareNumber, UIImageView * view);
int change_current_player(int CurrentPlayer);
void reset_images(UIImageView * view1, UIImageView * view2, UIImageView * view3, UIImageView * view4, UIImageView * view5
                  , UIImageView * view6, UIImageView * view7, UIImageView * view8, UIImageView * view9);
bool check_win(int square1_symbol, int square2_symbol, int square3_symbol, int square4_symbol, int square5_symbol,
               int square6_symbol, int square7_symbol, int square8_symbol, int square9_symbol);

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    square1_visited = @"FALSE";
    square2_visited = @"FALSE";
    square3_visited = @"FALSE";
    square4_visited = @"FALSE";
    square5_visited = @"FALSE";
    square6_visited = @"FALSE";
    square7_visited = @"FALSE";
    square8_visited = @"FALSE";
    square9_visited = @"FALSE";
    
    square1_symbol = 100;
    square2_symbol = 100;
    square3_symbol = 100;
    square4_symbol = 100;
    square5_symbol = 100;
    square6_symbol = 100;
    square7_symbol = 100;
    square8_symbol = 100;
    square9_symbol = 100;
    
    current_player = 1;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////FUCNTION TO CHECK WIN/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

bool check_win(int square1_symbol, int square2_symbol, int square3_symbol, int square4_symbol, int square5_symbol,
               int square6_symbol, int square7_symbol, int square8_symbol, int square9_symbol)
{
    //Left corner to bottom right corner diagonal
    if( (square1_symbol == 1 && square5_symbol ==1 && square9_symbol == 1) ||
       (square1_symbol == 0 && square5_symbol == 0 && square9_symbol == 0) )
    {
        return true;
    }
    
    //Right corner to bottom left corner diagonal
    else if( (square3_symbol == 1 && square5_symbol == 1 && square7_symbol == 1) ||
            (square3_symbol == 0 && square5_symbol == 0 && square7_symbol == 0) )
    {
        return true;
    }
    
    //First Row
    else if( (square1_symbol == 1 && square2_symbol == 1 && square3_symbol == 1) ||
            (square1_symbol == 0 && square2_symbol == 0 && square3_symbol == 0) )
    {
        return true;
    }
    
    //Second Row
    else if( (square4_symbol == 1 && square5_symbol == 1 && square6_symbol == 1) ||
            (square4_symbol == 0 && square5_symbol == 0 && square6_symbol == 0) )
    {
        return true;
    }
    
    //Third Row
    else if( (square7_symbol == 1 && square8_symbol == 1 && square9_symbol == 1) ||
            (square7_symbol == 0 && square8_symbol == 0 && square9_symbol == 0) )
    {
        return true;
    }
    
    //First Column
    else if( (square1_symbol == 1 && square4_symbol == 1 && square7_symbol == 1) ||
            (square1_symbol == 0 && square4_symbol == 0 && square7_symbol == 0) )
    {
        return true;
    }
    
    //Second Column
    else if( (square2_symbol == 1 && square5_symbol == 1 && square8_symbol == 1) ||
            (square2_symbol == 0 && square5_symbol == 0 && square8_symbol == 0) )
    {
        return true;
    }
    
    //Third Column
    else if( (square3_symbol == 1 && square6_symbol == 1 && square9_symbol == 1) ||
            (square3_symbol == 0 && square6_symbol == 0 && square9_symbol == 0) )
    {
        return true;
    }
    
    return false;
    
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////FUCNTION TO RESET IMAGES//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void reset_images(UIImageView * view1, UIImageView * view2, UIImageView * view3, UIImageView * view4, UIImageView * view5
                  , UIImageView * view6, UIImageView * view7, UIImageView * view8, UIImageView * view9)
{
    view1.image = Nil;
    view2.image = Nil;
    view3.image = Nil;
    view4.image = Nil;
    view5.image = Nil;
    view6.image = Nil;
    view7.image = Nil;
    view8.image = Nil;
    view9.image = Nil;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////FUCNTION TO CHANGE CURRENT PLAYER///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int change_current_player(int CurrentPlayer)
{
    if(CurrentPlayer == 1)
    {
        return 0;
    }
    else if(CurrentPlayer == 0)
    {
        return 1;
    }
    //return Nil or something to get rid of the warning
    return 17;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////RESET BUTTON//////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-(IBAction)reset:(id)sender
{
    square1_visited = @"FALSE";
    square2_visited = @"FALSE";
    square3_visited = @"FALSE";
    square4_visited = @"FALSE";
    square5_visited = @"FALSE";
    square6_visited = @"FALSE";
    square7_visited = @"FALSE";
    square8_visited = @"FALSE";
    square9_visited = @"FALSE";
    
    current_player = 1;
    
    square1_image.image = Nil;
    square2_image.image = Nil;
    square3_image.image = Nil;
    square4_image.image = Nil;
    square5_image.image = Nil;
    square6_image.image = Nil;
    square7_image.image = Nil;
    square8_image.image = Nil;
    square9_image.image = Nil;
    
    square1_symbol = 100;
    square2_symbol = 100;
    square3_symbol = 100;
    square4_symbol = 100;
    square5_symbol = 100;
    square6_symbol = 100;
    square7_symbol = 100;
    square8_symbol = 100;
    square9_symbol = 100;
    
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////CHANGE IMAGE FUNCTION///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void ChangeImage (int CurrentPlayer, int SquareNumber, UIImageView * view)
{
    //Call X image
    if(CurrentPlayer == 1)
    {
        if(SquareNumber == 1){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 2){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 3){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 4){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 5){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 6){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 7){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 8){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
        else if(SquareNumber == 9){
            [view setImage:[UIImage imageNamed:@"x.png"]];}
    }
    
    //call 0 image
    else if(CurrentPlayer == 0)
    {
        if(SquareNumber == 1){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 2){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 3){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 4){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 5){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 6){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 7){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 8){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        else if(SquareNumber == 9){
            [view setImage:[UIImage imageNamed:@"o.jpg"]];}
        
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////1-PLAYER AND 2-PLAYER BUTTON OPTIONS////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-(IBAction)OnePlayer:(id)sender
{
    num_players = 1;
}

-(IBAction)TwoPlayer:(id)sender
{
    num_players = 2;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////ALL THE BUTTONS FOR EACH SQUARE/////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-(IBAction)button1:(id)sender
{
    if(square1_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 1, square1_image);
        square1_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square1_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
    
}

-(IBAction)button2:(id)sender
{
    if(square2_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 2, square2_image);
        square2_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square2_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
}

-(IBAction)button3:(id)sender
{
    if(square3_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 3, square3_image);
        square3_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square3_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
    
}

-(IBAction)button4:(id)sender
{
    if(square4_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 4, square4_image);
        square4_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square4_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
}

-(IBAction)button5:(id)sender
{
    if(square5_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 5, square5_image);
        square5_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square5_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
}

-(IBAction)button6:(id)sender
{
    if(square6_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 6, square6_image);
        square6_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square6_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
}

-(IBAction)button7:(id)sender
{
    if(square7_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 7, square7_image);
        square7_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square7_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
    }
}

-(IBAction)button8:(id)sender
{
    if(square8_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 8, square8_image);
        square8_symbol = current_player;
        
        //check if they won else next players turn
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square8_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
        
    }
}

-(IBAction)button9:(id)sender
{
    if(square9_visited == @"TRUE")
    {
        //ignore button press because it has already been selected
    }
    
    else
    {
        //change image to whatever current player is and change current player
        ChangeImage(current_player, 9, square9_image);
        square9_symbol = current_player;
        
        
        //check if they won and get a bool value
        winner = check_win(square1_symbol, square2_symbol, square3_symbol, square4_symbol, square5_symbol,
                           square6_symbol, square7_symbol, square8_symbol, square9_symbol);
        
        if(winner == true)
        {
            square1_visited = @"FALSE";
            square2_visited = @"FALSE";
            square3_visited = @"FALSE";
            square4_visited = @"FALSE";
            square5_visited = @"FALSE";
            square6_visited = @"FALSE";
            square7_visited = @"FALSE";
            square8_visited = @"FALSE";
            square9_visited = @"FALSE";
            
            square1_symbol = 100;
            square2_symbol = 100;
            square3_symbol = 100;
            square4_symbol = 100;
            square5_symbol = 100;
            square6_symbol = 100;
            square7_symbol = 100;
            square8_symbol = 100;
            square9_symbol = 100;
            
            current_player = 1;
            
            reset_images(square1_image, square2_image, square3_image, square4_image, square5_image,
                         square6_image,square7_image, square8_image, square9_image);
        }
        
        else if(winner == false)
        {
            current_player = change_current_player(current_player);
            square9_visited = @"TRUE";
            
            if(num_players == 2)
            {
                //Other Person's Turn
            }
            
            else if(num_players == 1)
            {
                //Computer's Turn
            }
        }
        
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end