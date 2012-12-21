//
//  Cell.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"


@implementation Cell
@synthesize mySelf;
@synthesize mode1;
@synthesize mode2;

#define _CLEAR  0
#define _FILLED 1
#define _MARKED 2



-(id)init
{
	self=[super init];
	if (self != nil) {
        
        // ask director the the window size
		size = [[CCDirector sharedDirector] winSize];
        
        w = (size.width - size.width/8)/10;
        h = w;
            
    }
    
    return self;
    
}

-(void) setMode:(int)st{
    
    status = [NSNumber numberWithInt:st];
    int s = [status intValue];
    
    switch (s) {
            
        case _CLEAR:
            _mode1Opacity = 0;
            _mode2Opacity = 0;
            break;
            
        case _FILLED:
            _mode1Opacity = 255;
            _mode2Opacity = 0;
            break;
            
        case _MARKED:
            _mode2Opacity = 255;
            _mode1Opacity = 0;
            break;
            
        default:
            _mode1Opacity = 255;
            _mode2Opacity = 0;
            break;
    }
    
}

-(NSNumber *) getMode{
    
    return status;
}


-(void) setName:(NSString *)name{
    
    myName = [NSString stringWithString:name];
    
}

-(NSString *) getName{
    
    return myName;
}

-(void) setXpos:(int)xp{
    
    x = [NSNumber numberWithInt:xp];    
}

-(NSNumber *) getXpos{
    
    return x;
}

-(void) setYpos:(int)yp{
    
    y = [NSNumber numberWithInt:yp];    
}

-(NSNumber *) getYpos{
    
    return y;
}

-(void) setRect{
    
    
}

-(void) dealloc{
    
    [super dealloc];
}

@end
