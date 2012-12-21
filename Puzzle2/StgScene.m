//
//  StgScene.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TitleScene.h"
#import "StgScene.h"
#import "HelpScene.h"
#import "GameMainScene.h"
#import "VarStore.h"

/* Menu */
#define _TITLE  1
#define _HELP   2

/* Lucky Number 9 <3 */
/* Stage select */
#define _STAGE1 1
#define _STAGE2 2
#define _STAGE3 3
#define _STAGE4 4
#define _STAGE5 5
#define _STAGE6 6
#define _STAGE7 7
#define _STAGE8 8
#define _STAGE9 9


@implementation StgScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StgScene *layer = [StgScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init{
    if( (self = [super init]) ){
        
        // ask director the the window size
		size = [[CCDirector sharedDirector] winSize];
        
        [[VarStore sharedInstance] setStgSelected:2];
        bgNum = [[VarStore sharedInstance] getStgSelected];
        
        NSLog(@"BgNum: %d", bgNum);
        [self dispBg];
        [self dispStgMenu];
        [self dispStgSelect];
        
    }
    return  self;
}

-(void) dispBg{
    
    bg = [CCSprite spriteWithFile:@"selectBg.png"];
    bg.anchorPoint = ccp(0, 0);
    bg.position = ccp(0, 0);
    
    [self addChild:bg z:1];
    
}

-(void) dispStgMenu{
    
    title = [CCMenuItemImage itemFromNormalImage:@"selectTitle1.png" selectedImage:@"selectTitle2.png" target:self selector:@selector(getStgMenu:)];
    title.tag = _TITLE;
    
    help = [CCMenuItemImage itemFromNormalImage:@"selectHelp1.png" selectedImage:@"selectHelp2.png" target:self selector:@selector(getStgMenu:)];
    help.tag = _HELP;
    
    stgMenu = [CCMenu menuWithItems: title, help, nil];
    stgMenu.position = ccp(size.width/4, size.height/5.5f);
    [stgMenu alignItemsVertically];
    
    [self addChild:stgMenu z:2];    
}

-(void) getStgMenu:(CCMenuItemImage *)sender{
    
    if(sender.tag == _TITLE){
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[TitleScene scene]]];
        
    }
    else if(sender.tag == _HELP){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[HelpScene scene]]];
    }

}

-(void) dispStgSelect{
    
    stgIcon[0] = [CCMenuItemImage itemFromNormalImage:@"stg1.png" selectedImage:@"stg1.png" target:self selector:@selector(getStg:)];
    stgIcon[0].tag = _STAGE1;
    
    stgIcon[1] = [CCMenuItemImage itemFromNormalImage:@"stg2.png" selectedImage:@"stg2.png" target:self selector:@selector(getStg:)];
    stgIcon[1].tag = _STAGE2;
    
    stgIcon[2] = [CCMenuItemImage itemFromNormalImage:@"stg3.png" selectedImage:@"stg3.png" target:self selector:@selector(getStg:)];
    stgIcon[2].tag = _STAGE3;
    
    stgIcon[3] = [CCMenuItemImage itemFromNormalImage:@"stg4.png" selectedImage:@"stg4.png" target:self selector:@selector(getStg:)];
    stgIcon[3].tag = _STAGE4;
    
    stgIcon[4] = [CCMenuItemImage itemFromNormalImage:@"stg5.png" selectedImage:@"stg5.png" target:self selector:@selector(getStg:)];
    stgIcon[4].tag = _STAGE5;
    
    stgIcon[5] = [CCMenuItemImage itemFromNormalImage:@"stg6.png" selectedImage:@"stg6.png" target:self selector:@selector(getStg:)];
    stgIcon[5].tag = _STAGE6;
    
    stgIcon[6] = [CCMenuItemImage itemFromNormalImage:@"stg7.png" selectedImage:@"stg7.png" target:self selector:@selector(getStg:)];
    stgIcon[6].tag = _STAGE7;
    
    stgIcon[7] = [CCMenuItemImage itemFromNormalImage:@"stg8.png" selectedImage:@"stg8.png" target:self selector:@selector(getStg:)];
    stgIcon[7].tag = _STAGE8;
    
    stgIcon[8] = [CCMenuItemImage itemFromNormalImage:@"stg9.png" selectedImage:@"stg9.png" target:self selector:@selector(getStg:)];
    stgIcon[8].tag = _STAGE9;
        
    
    stages = [CCMenu menuWithItems:stgIcon[0], stgIcon[1], stgIcon[2], stgIcon[3],
               stgIcon[4], stgIcon[5], stgIcon[6], stgIcon[7], stgIcon[8], nil];  
    
    stages.position = ccp(size.width/2, size.height/1.6f);
    
    [stages alignItemsInColumns:
        [NSNumber numberWithInt:3],
        [NSNumber numberWithInt:3],
        [NSNumber numberWithInt:3], nil]; 
    
    [self addChild:stages z:2];
    
}

-(void) getStg:(CCMenuItemImage *)sender{
    
    if(sender.tag == _STAGE1){
        [[VarStore sharedInstance] setStgSelected:1];
    }
    else if(sender.tag == _STAGE2){        
        [[VarStore sharedInstance] setStgSelected:2];
    }
    else if(sender.tag == _STAGE3){
        [[VarStore sharedInstance] setStgSelected:3];
    }
    else if(sender.tag == _STAGE4){
        [[VarStore sharedInstance] setStgSelected:4];        
    }
    else if(sender.tag == _STAGE5){
        [[VarStore sharedInstance] setStgSelected:5];
    }
    else if(sender.tag == _STAGE6){
        [[VarStore sharedInstance] setStgSelected:6];
    }
    else if(sender.tag == _STAGE7){
        [[VarStore sharedInstance] setStgSelected:7];
    }
    else if(sender.tag == _STAGE8){
        [[VarStore sharedInstance] setStgSelected:8];
    }
    else if(sender.tag == _STAGE9){
        [[VarStore sharedInstance] setStgSelected:9];
    }
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFadeBL transitionWithDuration:1 scene:[GameMainScene scene]]];
}

-(void) dealloc{
 /*   
    [bg release];
    [title release];
    [help release];
    
    for(int i=0; i<9; i++){
        [stgIcon[i] release];
    } */
    
   [super dealloc];
}
@end
