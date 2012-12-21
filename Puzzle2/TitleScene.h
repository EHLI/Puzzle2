//
//  TitleScene.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameData.h"

@interface TitleScene : CCLayer {
    
    CGSize size; //Obtain screen size
    
    CCSprite *bg; //Back ground image
    
    /* Menu on Title scene */
    CCMenu *titleMenu; 
    CCMenuItemImage *start, *help;  //Menu images
    
    GameData *gameData;
    
}

+(CCScene *) scene;
-(void) dispBg; // Display Background of the scene//
-(void) dispTitleMenu; // Display Title Menu //
-(void) getTitleMenu:(CCMenuItemImage *)sender; // Get menu item from Title menu //


@end
