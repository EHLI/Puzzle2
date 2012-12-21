//
//  StgScene.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "VarStore.h"

@interface StgScene : CCLayer {
    
    CGSize size; //Obtain screen size

    CCSprite *bg; //Back ground image
    int bgNum;
    
    /* Menu on Stage scene */
    CCMenu *stgMenu;
    CCMenuItemImage *title, *help; //Menu images
    
    /* Menu for selecting stages */
    CCMenu *stages;
    //Menu images
    CCMenuItemImage *stgIcon[9]; //Menu images 
    
    /* single tone test */
    VarStore *varStore;
    
}

+(CCScene *) scene;
-(void) dispBg; // Display Background of the scene //
-(void) dispStgMenu; // Display Stage menu //
-(void) getStgMenu:(CCMenuItemImage *)sender;
-(void) dispStgSelect; //Display menu for selecting stages //
-(void) getStg:(CCMenuItemImage *)sender;  //

@end
