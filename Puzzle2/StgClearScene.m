//
//  StgClearScene.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StgClearScene.h"
#import "TitleScene.h"
#import "GameMainScene.h"
#import "StgScene.h"

#define _BACK   1
#define _NEXT   2
#define _TITLE  3

@implementation StgClearScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StgClearScene *layer = [StgClearScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init
{
    if( (self=[super init])) {
        
        // ask director the the window size
		size = [[CCDirector sharedDirector] winSize];
        
        // Get Stage number //
        stgNum = [[VarStore sharedInstance] getStgSelected];

        
        /* Display back ground image */
        bg = [CCSprite spriteWithFile:@"stgClearBg.png"];
        bg.anchorPoint = ccp(0, 0);
        bg.position = ccp(0, 0);
        
        /* Init Stage clear Picture */
        picNum = [NSString stringWithFormat:@"clearPic%d.png", stgNum];
        clearPic = [CCSprite spriteWithFile:picNum];
        clearPic.position = ccp(size.width/2, size.height/2);
        [clearPic setScaleX:50/clearPic.contentSize.width];
        [clearPic setScaleY:50/clearPic.contentSize.height];
        
        [self addChild:clearPic z:2];
        
        id action = [CCScaleBy actionWithDuration:5.0f scale:4.0f];
        [clearPic runAction:action];
        
        [self addChild:bg z:1];
        
        [self dispMenu];        
    }
    
    return self;
    
}

-(void) dispMenu{
    
    title = [CCMenuItemImage itemFromNormalImage:@"helptitle1.png" selectedImage:@"helptitle2.png" target:self selector:@selector(getHelpMenu:)];
    title.tag = _TITLE;
    
    back = [CCMenuItemImage itemFromNormalImage:@"helpback1.png" selectedImage:@"helpback2.png" disabledImage:@"helpback3.png" target:self selector:@selector(getHelpMenu:)];
    back.tag = _BACK;
    
    next = [CCMenuItemImage itemFromNormalImage:@"helpnext1.png" selectedImage:@"helpnext2.png" disabledImage:@"helpnext3.png" target:self selector:@selector(getHelpMenu:)];
    next.tag = _NEXT;
    
    helpMenu = [CCMenu menuWithItems: back, title, next, nil];
    helpMenu.position = ccp(size.width/2, size.height/24);
    [helpMenu alignItemsHorizontally];
    
    [self addChild:helpMenu z:2];    
    
}

-(void) getHelpMenu:(CCMenuItemImage *)sender{
    
    
    if(sender.tag == _TITLE){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:1 scene:[TitleScene scene]]];
    }
    else if(sender.tag == _BACK){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[StgScene scene]]];
    }
    else if(sender.tag == _NEXT){
        
        if(stgNum < 9){
            stgNum++;
            [[VarStore sharedInstance] setStgSelected:stgNum];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[GameMainScene scene]]];
        }
        else{
            stgNum=1;
            [[VarStore sharedInstance] setStgSelected:stgNum];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[GameMainScene scene]]];
        }
        
    }    
    
}

-(void) dealloc{
    
/*    [bg release];
    [back release];
    [next release];
    [title release]; */
    
    [super dealloc];
}


@end
