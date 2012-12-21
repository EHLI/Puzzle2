//
//  Board.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Cell;
@interface Board : CCSprite {
    
    CGSize size;
    CCArray *puzzle;
    
}

@end
