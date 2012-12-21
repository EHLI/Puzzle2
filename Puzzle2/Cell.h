//
//  Cell.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Cell : CCSprite {
    
    /* Get screen size */
    CGSize size;
    
    /* Select mode */
    bool mode1;
    bool mode2;
       
    /* Mode select status */
    NSNumber *status; 
    int _mode1Opacity;
    int _mode2Opacity;
    
    /* Make rectangle */
    NSNumber *x; //x point
    NSNumber *y; //y point
    float w;  // width
    float h;  // height
    
    CGPoint pos;
    
    /* status */
    int mySelf;
    
    NSString *myName;
    
}

-(id)init;
@property (nonatomic, assign) int mySelf;
@property (nonatomic, assign) bool mode1;
@property (nonatomic, assign) bool mode2;

-(void) setName:(NSString *)name;
-(NSString *) getName;
-(void) setMode:(int)st;
-(NSNumber *) getMode;
-(void) setXpos:(int)xp;
-(void) setYpos:(int)yp;
-(NSNumber *) getXpos;
-(NSNumber *) getYpos;
-(void) setRect;

@end
