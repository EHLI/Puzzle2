//
//  GameMainScene.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameMainScene.h"
#import "TitleScene.h"
#import "StgScene.h"
#import "StgClearScene.h"

@implementation GameMainScene

#define _MODE1  1
#define _MODE2  2
#define _TITLE  1
#define _BACK   2

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameMainScene *layer = [GameMainScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init
{
    if( (self = [super init]) ){
        
        /* init */
        self.isTouchEnabled = YES;
        mode1Selected = YES;
    
        size = [[CCDirector sharedDirector] winSize];
        boardMg = size.width/8;
        boardSize = (size.width-boardMg);
        cellSize = boardSize/10; 
        mode1Selected = TRUE;
        
        /* Set Back ground data */
        int stgNum;
        stgNum = [[VarStore sharedInstance] getStgSelected];
        bgNum = [NSString stringWithFormat:@"StgBg%d.png", stgNum];
        NSLog(@"bgNum: %@", bgNum);
        
        bg = [CCSprite spriteWithFile:bgNum];
        board = [CCSprite spriteWithFile:@"board.png"];
        modeBg = [CCSprite spriteWithFile:@"modeBg.png"];
        
        
        int *p;
        
        p = [[VarStore sharedInstance] getStgArr:stgNum];
        
        for(int i=0; i<10; i++){
            for(int j=0; j<10; j++){
                arr1[i][j] = *p;
                p++;
                
                NSLog(@"arr1[%d][%d]:%d", i, j, arr1[i][j]);
            }
        }

        
  /*       Puzzle temp 
        for(int i=0; i<10; i++){
            for(int j=0; j<10; j++){
                if((i==1 || i==3 || i==5) && (j==1 || j==3 || j==5)){
                    arr1[i][j] = 1;
                }
                else arr1[i][j] = 0;
            }
        }*/
        
        /*
        CCLabelTTF *temp;
        temp = [CCLabelTTF labelWithString:@"11111" dimensions:CGSizeMake(cellSize, boardMg) alignment:UITextAlignmentCenter fontName:@"Arial" fontSize:12];
        temp.anchorPoint = ccp(0, 0);
        temp.position = ccp(boardMg+(cellSize*0), size.height/8+boardSize);
        temp.color = ccc3(0, 0, 0);

        [self addChild:temp z:3]; */
                        
        /* call */
        [self createCell];
        [self dispBg];
        [self dispModeMenu];
        [self dispGameMenu];
        //[self dispTimer];
        [self chkPuzzle];
        [self dispPuzzleLabel];
        
    }
    
    return self;

}

//////////////////////
//  *Touch Event*  //
/////////////////////

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch*touch=[touches anyObject];
    location=[touch locationInView:[touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
        
    [self chkCell];
    [self chkAnswer];

}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    location = [touch locationInView: [touch view]];
    location=[[CCDirector sharedDirector] convertToGL:location];
    
    [self chkCell];
    [self chkAnswer];
}

//////////////////////////////
// Display Backround image //
/////////////////////////////
-(void) dispBg{
    
    bg.anchorPoint = ccp(0, 0);
    bg.position = ccp(0, 0);
    
    [self addChild:bg z:1];
    
    board.anchorPoint = ccp(0, 0);
    board.position = ccp(0, size.height/8);
    board.opacity = 230;
    
    [self addChild:board z:2];
    
    
}

//////////////////////////////////
//  Set mode select menu:       //
//                              //
// Mode1: Fill the cell (black) //
// Mode2: Mark the cell ("X")   //
//////////////////////////////////

-(void) dispModeMenu{
    
    mode1 = [CCMenuItemImage itemFromNormalImage:@"mode1.png" selectedImage:@"mode1_2.png" target:self selector:@selector(getMode:)];
    mode1.tag = _MODE1;
    
    mode2 = [CCMenuItemImage itemFromNormalImage:@"mode2.png" selectedImage:@"mode2_2.png" target:self selector:@selector(getMode:)];
    mode2.tag = _MODE2;
    
    modeMenu = [CCMenu menuWithItems:mode1, mode2, nil];
    
    modeMenu.position = ccp(size.width/4, board.position.y+boardSize+boardMg+cellSize/1.5f);
    NSLog(@"Board Y: %f Bordsize: %d", board.position.y, boardSize);
    [modeMenu alignItemsHorizontallyWithPadding:10.f];
    
    modeBg.position = ccp(size.width/4, board.position.y+boardSize+boardMg+size.height/17.5f);
    
    [self addChild:modeBg z:2];
    [self addChild:modeMenu z:3];
    
}
-(void) getMode:(CCMenuItemImage *)sender{
                    
    if(sender.tag == _MODE1){
        
        mode1Selected = YES;
        mode2Selected = NO;
        NSLog(@"MODE1!!");
                     
    }
    else if(sender.tag == _MODE2){
        
        mode2Selected = YES;
        mode1Selected = NO;
        NSLog(@"MODE2!!");
    }
    
}

/////////////////////////////
// Set game menu:          //
//                         //
// Go back to home(title)  //
// Go back to Stage select //
/////////////////////////////

-(void) dispGameMenu{
    
    title = [CCMenuItemImage itemFromNormalImage:@"title1.png" selectedImage:@"title2.png" target:self selector:@selector(getGameMenu:)];
    title.tag = _TITLE;
    
    back= [CCMenuItemImage itemFromNormalImage:@"back1.png" selectedImage:@"back2.png" target:self selector:@selector(getGameMenu:)];
    back.tag = _BACK;
    
    gameMenu = [CCMenu menuWithItems:title, back, nil];
    
    gameMenu.position = ccp(size.width/2, size.height/12);
    [gameMenu alignItemsHorizontallyWithPadding:45.0f];
    
    
    [self addChild:gameMenu z:2];
    
}

-(void) getGameMenu:(CCMenuItemImage *)sender{
    
    if(sender.tag == _TITLE){
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[TitleScene scene]]];
        
    }
    else if(sender.tag == _BACK){
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[StgScene scene]]];

    }
    
}


//////////////////////////////////////////////////
//  Init cell status:                           //
// Set cell positions and display on the screen //
//////////////////////////////////////////////////

-(void) createCell{
    
    int x, y;
    x = boardMg; 
    y = size.height/8+boardSize-cellSize;
    
    
    for(int i=0; i<10; i++){
        for(int j=0; j<10; j++){
            c[i][j].xp = x+cellSize*j;
           // NSLog(@"My Xpos: %d", c[i][j].xp);            
            c[i][j].yp = y-cellSize*i;
           // NSLog(@"My Ypos: %d", c[i][j].yp);
            c[i][j].mode = 0;
            
            fill[i][j] = [CCSprite spriteWithFile:@"mode1_2.png"];
            fill[i][j].anchorPoint = ccp(0, 0);
            fill[i][j].position = ccp(c[i][j].xp, c[i][j].yp);
            fill[i][j].visible = FALSE;
            
            mark[i][j] = [CCSprite spriteWithFile:@"mode2_2.png"];
            mark[i][j].anchorPoint = ccp(0, 0);
            mark[i][j].position = ccp(c[i][j].xp, c[i][j].yp);
            mark[i][j].visible = FALSE;
            
            [self addChild:fill[i][j] z:3];
            [self addChild:mark[i][j] z:3];

        }
        
    }

}

//////////////////////////////////////////////////
//  Check the cell mode with touched position   //
//  and update the cell with new status(mode)   //
//////////////////////////////////////////////////

-(void) chkCell{
    NSLog(@"touch: %f %f", location.x, location.y);
    
    
    int x, y;
    x = boardMg; 
    y = size.height/8+boardSize-cellSize;
    
/*    if(CGRectContainsPoint(CGRectMake(x+cellSize, y-cellSize, cellSize, cellSize), location)){
        NSLog(@"TOUCH!!!>_<");
    } */
  
     for(int i=0; i<10; i++){
         for(int j=0; j<10; j++){
             if(CGRectContainsPoint(CGRectMake(x+cellSize*j, y-cellSize*i, cellSize, cellSize), location)){
                 
                 
                 if(mode1Selected){
                     // Filling mode is selected //
                     if(c[i][j].mode == 0){ 
                         // The cell is blank, make it filled //
                         fill[i][j].visible = TRUE;
                         c[i][j].mode = 1;
                         
                     }
                     else if(c[i][j].mode == 1){ 
                         // The cell is filled, make it blank//
                         fill[i][j].visible = FALSE;
                         c[i][j].mode = 0;
                         
                     }
                     else if(c[i][j].mode ==2) {
                         // The cell is marked, make it filled //
                         fill[i][j].visible = TRUE;
                         c[i][j].mode = 1;
                         mark[i][j].visible = FALSE;
                         
                     }
                 }
                 else if(mode2Selected){
                     // "X" Makring mode is selected //
                     if(c[i][j].mode == 0){ 
                         // The cell is blank, make it marked //
                         mark[i][j].visible = TRUE;
                         c[i][j].mode = 2;
                     }
                     else if(c[i][j].mode == 1){ 
                         // The cell is filled, make it marked//
                         fill[i][j].visible = FALSE;
                         c[i][j].mode = 2;
                         mark[i][j].visible = TRUE;
                         

                     }
                     else if(c[i][j].mode ==2) {
                         // The cell is marked, make it blank //
                         mark[i][j].visible = FALSE;
                         c[i][j].mode = 0;
                     }
                     
                 }
                 NSLog(@"cellstatus: %d", c[i][j].mode);
                                  
                 break;
             }
         }
     }     
    
}

//////////////////////////////////////
//  Check an answer of the puzzle:  // 
//  Make hints labels.              //
//////////////////////////////////////

-(void) chkPuzzle {
    
    int cntRow = 0, cntCol = 0;
    
    for(int i=0; i<10; i++){
        for(int j=0; j<10; j++){
            
            if(arr1[i][j] == 1){
                cntRow++;
                arrRow[i][j] = 0;
            }
            else if(arr1[i][j] == 0 && j != 9){

                arrRow[i][j] = cntRow;
             //   NSLog(@"cntRow input(i:%dj:%d): %d, arrRow[%d][%d]:%d", i, j, cntRow, i, j, arrRow[i][j]);
                cntRow = 0;
            }
            
            
            if(arr1[j][i] == 1){
                cntCol++;
                arrCol[i][j] = 0;
            }
            else if(arr1[j][i] == 0 && j != 9){
                arrCol[i][j] = cntCol;

                cntCol = 0;
            }
            //arrRow[i][j] = cntRow;

            if(j == 9){
                arrRow[i][j] = cntRow;
          //      NSLog(@"cntRow input(i:%dj:%d): %d, arrRow[%d][%d]:%d", i, j, cntRow, i, j, arrRow[i][j]);

                arrCol[i][j] = cntCol;
            }
         //  NSLog(@"arr1[%d][%d]:cntRow:%d arrRow[%d][%d]: %d", i, j, cntRow, i, j, arrRow[i][j]);
           //NSLog(@"arr1[%d][%d]:cntCol:%d arrCol[%d][%d]: %d", i, j, cntCol, i, j, arrCol[i][j]);
        }
        cntRow = 0;
        cntCol = 0;
    }
    NSLog(@"out loop: arrRow[2][9]:%d", arrRow[2][9]);
    for(int i=0; i<10; i++){
        rowLabel[i] = [[NSMutableString alloc] init];
        colLabel[i] = [[NSMutableString alloc] init];

        for(int j=0; j<10; j++){
            

          
            if(arrRow[i][j] != 0){
                [rowLabel[i] appendFormat:@"%d ", arrRow[i][j]];

               // rowLabel[i] = [NSString stringWithFormat:@"%d", arrRow[i][j]];
            }
            else{
                [rowLabel[i] stringByReplacingOccurrencesOfString:@"0" withString:@""];
             //   rowLabel[i] = [rowLabel[i] stringByReplacingOccurrencesOfString:@"0" withString:@""];
            } 
            if(arrCol[i][j] != 0){
                [colLabel[i] appendFormat:@"%d\n", arrCol[i][j]];
                //colLabel[i] = [NSString stringWithFormat:@"%d", arrCol[i][j]];
            }
            else{
                [colLabel[i] stringByReplacingOccurrencesOfString:@"0" withString:@""];
             //   colLabel[i] = [colLabel[i] stringByReplacingOccurrencesOfString:@"0" withString:@""];
            }
          // NSLog(@"arrRow:%d arrCol:%d", arrRow[i][j], arrCol[i][j]);
        }
        //NSLog(@"rowLabel%d:%@", i, rowLabel[i]);

    }

}

////////////////////////////////////
// Display Puzzle's hints labels  //
////////////////////////////////////
    
-(void) dispPuzzleLabel {
    
    for(int i=0; i<10; i++){
        
        ccrowLabel[i] = [CCLabelTTF labelWithString:rowLabel[i] dimensions:CGSizeMake(boardMg, cellSize) alignment:UITextAlignmentCenter fontName:@"Arial" fontSize:10]; 
        ccrowLabel[i].anchorPoint = ccp(0, 0);
        ccrowLabel[i].position = ccp(0, size.height/8+cellSize*(9-i));
        ccrowLabel[i].color = ccc3(0, 0, 0);
        
        cccolLabel[i] = [CCLabelTTF labelWithString:colLabel[i] dimensions:CGSizeMake(cellSize, boardMg) alignment:UITextAlignmentCenter fontName:@"Arial" fontSize:9];
        cccolLabel[i].anchorPoint = ccp(0, 0);
        cccolLabel[i].position = ccp(boardMg+(cellSize*i), size.height/8+boardSize);
        cccolLabel[i].color = ccc3(0, 0, 0);
        
        [self addChild:ccrowLabel[i] z:3];
        [self addChild:cccolLabel[i] z:3];
    }
    
}

//////////////////////////////////////////
//  Check the user answer sheet:        //
//  Compare it with the puzzle answer   //
//  (cell mode = user's current answer) //
//////////////////////////////////////////

-(void) chkRowAnswer{
            
    for(int i=0; i<10; i++){
        for(int j=0; j<10; j++){
            if(arr1[i][j] != c[i][j].mode){
                if(arr1[i][j] == 0 && c[i][j].mode == 2){
                    continue;
                }
                else{
                    ansRow[i] = 0;
                    break;
                }
            }
            else{
                ansRow[i] = 1;
            }
     /*       if(j == 9){
                ansRow[i] = 1;
            }*/
        }
    }
}

-(void) chkColAnswer{
    
    for(int i=0; i<10; i++){
        for(int j=0; j<10; j++){
            if(arr1[j][i] != c[j][i].mode){
                if(arr1[j][i] == 0 && c[j][i].mode == 2){
                    continue;
                }
                else{
                    ansCol[i] = 0;
                    break;
                }
            }
            else{
                ansCol[i] = 1;
            }
      /*      if(j == 9){
                ansCol[i] = 1;
            } */

        }
    }   
    
}

-(void) chkAnswer{
    
    [self chkRowAnswer];
    [self chkColAnswer];
    
    clearFlg = 1;
    
    for(int i=0; i<10; i++){
        
        NSLog(@"i:%d R:%d C:%d", i, ansRow[i], ansCol[i]);
        
        if(ansCol[i]==0 || ansRow[i]==0){
            clearFlg=0;
        }
        
        if(ansRow[i]==1){
            ccrowLabel[i].color = ccc3(0, 180, 0);
        }
        else {
            ccrowLabel[i].color = ccc3(0, 0, 0);
        }
        
        if(ansCol[i]==1){
            cccolLabel[i].color = ccc3(0, 180, 0);
        }
        else {
            cccolLabel[i].color = ccc3(0, 0, 0);
        }
        

    }
    
    NSLog(@"flg: %d", clearFlg);
    
    if(clearFlg==1) {
        NSLog(@"Stage Clear!! XD");
        [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:3 scene:[StgClearScene scene]]];

    }
}


//////////////////////////
//  Display Play time  //
/////////////////////////

-(void) dispTimer{
    
    //Initialize the date format
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"mm:ss"];
    currentTime = [NSDate date];
    timeInterval = [currentTime timeIntervalSinceNow];
    //mins = timeInterval;
    
    //runningTime += -[currentTime timeIntervalSinceNow];

    dateString = [NSString stringWithFormat:@"%@", timeInterval];  
    
    //Initialize CClableTTF for time
    timeString = [CCLabelTTF labelWithString:dateString fontName:@"Arial" fontSize:24];
    [timeString retain];
    timeString.anchorPoint = ccp(0, 0);
    timeString.color =ccc3(57, 57, 57);
    timeString.position = ccp(size.width/1.5f, board.position.y+boardSize+boardMg);
    
    [self addChild:timeString z:3];
    
    [self schedule: @selector(tick:) interval:0.5];
    
}

-(void) tick: (ccTime) dt
{
    
    currentTime = [NSDate date];
    
    //runningTime += -[currentTime timeIntervalSinceNow];
    timeInterval = [currentTime timeIntervalSinceNow];
    //mins = timeInterval/60;
    
    dateString = [NSString stringWithFormat:@"%@", timeInterval];  

   // dateString = [dateFormat stringFromDate:currentTime];
    [timeString setString:dateString];	
    
    
}
-(void) dealloc{
    
    for(int i=0; i<10; i++){
        [rowLabel[i] release];
    }
    [dateFormat release];
/*    
    [bg release];
    [board release];
    
    [mode1 release];
    [mode2 release];

    [title release];
    [back release];

    for(int i=0; i<10; i++){
        for(int j=0; j<10; j++){
            [fill[i][j] release];
            [mark[i][j] release];
        }
        [cccolLabel[i] release];
        [ccrowLabel[i] release];
    }
    
    
    [timeString release]; */
    
    
    [super dealloc];
}
@end
