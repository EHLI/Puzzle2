//
//  GameData.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameData.h"


@implementation GameData
@synthesize stage;

- (id) init {
	if((self=[super init])) {
		NSLog(@"GameData init");
		
        
	}
	return self;
}

- (void) dealloc {
	NSLog(@"GameData dealloc");
	[super dealloc];
}



@end
