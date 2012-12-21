//
//  GameData.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

#import "cocos2d.h"

@interface GameData : NSObject {
    
    int stage;
    
}

@property (readwrite) int stage;

@end
