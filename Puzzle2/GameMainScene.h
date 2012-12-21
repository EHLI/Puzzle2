//
//  GameMainScene.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Cell.h"
#import "Board.h"

@interface GameMainScene : CCLayer {
    
    CGSize size; //Obtain screen size
    
    CCSprite *bg; //Back ground image
    CCSprite *board; //Puzzle board
    CCSprite *modeBg; // Background for Mode icon
    
    /* Get Stage data */
    NSString *bgNum;
    
    CCMenu  *modeMenu;
    CCMenuItemImage *mode1, *mode2; //Mode select image
    
    CCMenu  *gameMenu;
    CCMenuItemImage *title, *back; //Scene select image

    
    CCSprite *fill[10][10], *mark[10][10]; //Puzzle cell checking image 
    
    /* Cell structure */
    struct cell{
        int xp;
        int yp;
        int mode;
    };
    struct cell c[10][10];

    
    CGPoint location; // Touch location
    
    int boardSize; //Board size
    int cellSize; //Cell size of puzzle board
    int boardMg; //Margin
    
    /* Mode select flag */
    bool mode1Selected;
    bool mode2Selected;
    
    /* Game clear flag */
    int clearFlg;
    
    /* Puzzle array */
    int arr1[10][10]; 
    int arrRow[10][10];
    int arrCol[10][10];
    
    char arrRowStr[10];
    char arrColStr[10];
    
    NSMutableString *rowLabel[10];
    NSMutableString *colLabel[10];
    
    CCLabelTTF *ccrowLabel[10];
    CCLabelTTF *cccolLabel[10];
    
    /* Cheking asnwer */
    int ansRow[10]; // check answers for rows of the puzzle
    int ansCol[10]; // check answers for columns of the puzzle
    
    /* Set timer */    
    NSDate *currentTime, *startTime;// Current Time and start time of game
    float runningTime;
	NSDateFormatter *dateFormat; // The date format
	NSString *dateString; // String of current time in format
    CCLabelTTF *timeString; // String of time
    
    NSTimeInterval timeInterval;
    int mins;

}

+(CCScene *) scene;
-(void) dispBg; // Display Background of the scene //
-(void) dispModeMenu; // Display mode menu //
-(void) dispGameMenu; // Display game menu (home, go back) //
-(void) chkMode; // Check Game mode (Fill or "X" mark the cell) //
-(void) getMode:(CCMenuItemImage *)sender;  // Get Game mode status
-(void) getGameMenu:(CCMenuItemImage *)sender; // Get Game Menu selected //

-(void) touchEnabled; // Enable Touch event //
-(void) dispTimer;  // Display timer //
-(void) tick: (ccTime) dt; // Update timer //

/* Cell management methods */
-(void) createCell;  // Create cell information (position, mode, ..) //
-(void) chkCell;  // Check the cell status //
-(void) chkPuzzle; // Check the user answer //
-(void) dispPuzzleLabel; // Display hints lables //

/* Answer cheking method */
-(void) chkRowAnswer;
-(void) chkColAnswer;
-(void) chkAnswer;


@end
