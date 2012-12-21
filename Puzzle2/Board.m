//
//  Board.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Cell.h"

@implementation Board

-(id) init{
    
    // ask director the the window size
    size = [[CCDirector sharedDirector] winSize];

    puzzle = [[CCArray alloc] initWithCapacity:100];
    
    
    return self;    
}

@end
