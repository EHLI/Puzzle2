//
//  StgClearScene.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "VarStore.h"

@interface StgClearScene : CCLayer {
    
    CGSize size; //Obtain screen size
    
    CCSprite *bg; //Back ground image
    CCSprite *clearPic; // Completed puzzle image 
    
    /* Get Stage data */
    int stgNum;
    NSString *picNum;
        
    /* Menu images */
	CCMenuItemImage* back;
	CCMenuItemImage* next;
    CCMenuItemImage* title;
    
    CCMenu *helpMenu;
	
}

+(CCScene *) scene;

-(void) dispMenu; // Display Help menu
-(void) getHelpMenu:(CCMenuItemImage *)sender; // Get menu item from Help menu //


@end
