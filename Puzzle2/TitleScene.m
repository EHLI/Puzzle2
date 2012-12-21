//
//  TitleScene.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

#import "TitleScene.h"
#import "StgScene.h"
#import "HelpScene.h"

/* Menu tags */
#define _START  1
#define _HELP   2


@implementation TitleScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TitleScene *layer = [TitleScene node];
	
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
        
        [self dispBg];
        [self dispTitleMenu];
        
        int *p;
        int t[10][10];
        
        p = [[VarStore sharedInstance] getStgArr:1];
        
        for(int i=0; i<10; i++){
            for(int j=0; j<10; j++){
                t[i][j] = *p;
                p++;
                
               // NSLog(@"t[%d][%d]:%d", i, j, t[i][j]);
            }
        }
              
    }
    
    return self;
    
}

/* Display background of the scene */
-(void) dispBg{
    
    bg = [CCSprite spriteWithFile:@"titlelogo.png"];
    bg.anchorPoint = ccp(0, 0);
    bg.position = ccp(0, 0);
    
    [self addChild:bg z:1];
    
}

/* Display Title scene menu */
-(void) dispTitleMenu{
    
    start = [CCMenuItemImage itemFromNormalImage:@"start1.png" selectedImage:@"start2.png" target:self selector:@selector(getTitleMenu:)];
    start.tag = _START;
    
    help = [CCMenuItemImage itemFromNormalImage:@"help1.png" selectedImage:@"help2.png" target:self selector:@selector(getTitleMenu:)];
    help.tag = _HELP;
    
    titleMenu = [CCMenu menuWithItems:start, help, nil];
    [titleMenu alignItemsVertically];
    
    titleMenu.position = ccp(size.width/2, size.height/4);
    
    [self addChild:titleMenu z:2];
    
}

/* Get menu item from Title scene menu */
-(void) getTitleMenu:(CCMenuItemImage *)sender{
 
    if(sender.tag == _START){
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFlipX transitionWithDuration:1 scene:[StgScene scene]]];

    }
    else if(sender.tag == _HELP){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelpScene scene]]];

    }
}

-(void) dealloc{
    
  /*  [bg release];
    bg = nil;
    [start release];
    start = nil;
    [help release];
    help = nil; */
    
    [super dealloc];
}

@end
