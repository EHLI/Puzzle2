//
//  HelpScene.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HelpScene.h"
#import "TitleScene.h"

#define _BACK   1
#define _NEXT   2
#define _TITLE  3

@implementation HelpScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelpScene *layer = [HelpScene node];
	
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
        
        /* Display back ground image */
        bg = [CCSprite spriteWithFile:@"helpBg.png"];
        bg.anchorPoint = ccp(0, 0);
        bg.position = ccp(0, 0);
        
        [self addChild:bg z:1];
        
        [self dispMenu];
        [self createHelp];
        
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
    
    [back setIsEnabled:NO];
    
    [self addChild:helpMenu z:2];    
    
}

-(void) getHelpMenu:(CCMenuItemImage *)sender{
    
    if(pgNum <= 1){
        
        [back setIsEnabled:NO];
    }
    else if(pgNum >= 3){
        [next setIsEnabled:NO];
    }
    
    if(sender.tag == _TITLE){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[TitleScene scene]]];
    }
    else if(sender.tag == _BACK){
        [next setIsEnabled:YES];
        
        if(pgNum > 0){
            pgNum--;
        }
        else {
            pgNum = 0;
        }
    }
    else if(sender.tag == _NEXT){
        [back setIsEnabled:YES];
        
        if(pgNum < 4){
            pgNum++;
        }
        else{
            pgNum = 4;
        }
    }
    
    [self dispHelp];
}

-(void) createHelp{
    
    pgNum = 0;
    
    helpImg[0] = [CCSprite spriteWithFile:@"helpPg1.png"];
    helpImg[1] = [CCSprite spriteWithFile:@"helpPg2.png"];
    helpImg[2] = [CCSprite spriteWithFile:@"helpPg3.png"];
    helpImg[3] = [CCSprite spriteWithFile:@"helpPg4.png"];
    helpImg[4] = [CCSprite spriteWithFile:@"helpPg5.png"];
    
    for(int i=0; i<5; i++){
        helpImg[i].position = ccp(size.width/2, size.height/2);
        if(i==0) {
            helpImg[i].visible = TRUE;
        }
        else {
            helpImg[i].visible = FALSE;
        }
        [self addChild:helpImg[i] z:3];
    }
    
}

-(void) dispHelp{
    
    for(int i=0; i<5; i++){
        
        if(i == pgNum){
            helpImg[i].visible = TRUE;
        }
        else {
            helpImg[i].visible = FALSE;
        }
    }
    
}


-(void) dealloc{
 /*   
    [bg release];
    bg = nil;
    [back release];
    back = nil;
    [next release];
    next = nil;
    [title release];
    title = nil;
    
    for(int i=0; i<5; i++){
        [helpImg[i] release];
        helpImg[i] = nil;
    } */
    
    [super dealloc];
}

@end
