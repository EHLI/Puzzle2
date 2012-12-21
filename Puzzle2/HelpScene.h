//
//  HelpScene.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HelpScene : CCLayer {
    CGSize size; //Obtain screen size
    
    CCSprite *bg; //Back ground image
    
    int pgNum;
    
    /* Menu images */
	CCMenuItemImage* back;
	CCMenuItemImage* next;
    CCMenuItemImage* title;
    
    CCMenu *helpMenu;
	
    /* Help description images */
    CCSprite *helpImg[5];
}

+(CCScene *) scene;

-(void) dispMenu; // Display Help menu
-(void) getHelpMenu:(CCMenuItemImage *)sender; // Get menu item from Help menu //
-(void) createHelp;
-(void) dispHelp;

@end
