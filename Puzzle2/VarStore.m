//
//  VarStore.m
//  Puzzle2
//
//  Created by Jenny Kim on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VarStore.h"

#include "string.h"

@implementation VarStore
@synthesize stgSelected;
@synthesize temp;
@synthesize labelRow;


- (id)init {
    if ((self = [super init])) {        
    }
    return self;
}


+(VarStore *) sharedInstance{
    
    // the instance of this class is stored here
    static VarStore *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        // initialize variables here
    }
    
    
    // return the instance of this class
    return myInstance;
}

-(void) setStgSelected:(int)stg{
    
    stgSelected = stg;
}

-(int) getStgSelected{
    
    return stgSelected;
}

-(int *) getStgArr:(int)stg{
    
    temp = malloc(sizeof(int)*100);
    
    int stg1[10][10] = {
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0
    };
    
    int stg2[10][10] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 0, 0, 1, 0, 0, 0, 0, 0,
        0, 1, 1, 1, 1, 0, 0, 0, 0, 0,
        0, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 1, 1, 0, 0, 0, 1, 0, 1,
        0, 1, 1, 0, 0, 0, 0, 0, 0, 1,
        0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 
        0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 
        0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 
        0, 0, 1, 1, 1, 1, 1, 0, 0, 0
    };
    
    int stg3[10][10] = {
        0, 1, 1, 1, 1, 1, 1, 1, 1, 0,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 
        1, 0, 1, 1, 0, 0, 1, 1, 0, 1,
        1, 0, 1, 1, 0, 0, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 1, 0, 0, 0, 0, 1, 0, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        0, 1, 1, 1, 1, 1, 1, 1, 1, 0
    };
    
    int stg4[10][10] = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
        1, 0, 1, 1, 1, 1, 1, 1, 0, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 
        1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 
        1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 
        1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 
        1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    };
    
    int stg5[10][10] = {
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
        0, 0, 1, 1, 0, 1, 1, 1, 0, 0,
        0, 1, 1, 1, 1, 1, 1, 1, 1, 0,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1,
        0, 1, 1, 1, 1, 1, 1, 1, 1, 0,
        0, 0, 1, 1, 1, 1, 1, 1, 0, 0
    };
    
    int stg6[10][10] = {
        
        0, 0, 0, 0, 1, 1, 1, 0, 0, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 1, 1, 1, 1, 1, 1, 0, 0, 0,
        1, 1, 0, 1, 1, 1, 1, 1, 0, 0,
        1, 1, 1, 1, 0, 0, 1, 1, 1, 0,
        1, 1, 1, 0, 0, 0, 0, 1, 1, 0,
        0, 1, 0, 0, 0, 0, 0, 1, 1, 1,
        0, 1, 0, 0, 0, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
        0, 0, 0, 0, 0, 0, 1, 0, 0, 1    
    };
    
    int stg7[10][10] = {
        0, 0, 0, 0, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 
        1, 0, 0, 0, 1, 1, 1, 1, 1, 0,
        1, 1, 0, 0, 1, 1, 1, 1, 1, 0,
        0, 1, 1, 0, 0, 1, 1, 1, 0, 0,
        0, 0, 1, 0, 0, 1, 1, 1, 0, 0,
        0, 1, 1, 0, 1, 1, 1, 1, 0, 0,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 0,
        0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        0, 0, 1, 1, 1, 1, 1, 1, 1, 1
    };
    
    int stg8[10][10] = {
        0, 1, 1, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 0, 0, 0, 1, 1, 0, 0,
        0, 1, 1, 0, 0, 1, 1, 1, 1, 0,
        0 ,0 ,1 ,1 ,1 ,1 ,1 ,1 ,1, 1,
        0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
        0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 
        0, 0, 0, 0, 1, 1, 0, 0, 1, 1,
        0, 0, 0, 0, 1, 1, 0, 0, 1, 1,
        0, 0, 0, 0, 1, 1, 0, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    };

    int stg9[10][10] = {
        0, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 0, 0, 1, 1, 1, 1, 1, 1, 0,
        0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 
        0, 0, 1, 1, 1, 1, 1, 1, 1, 1,  
        0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 
        0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
        0, 0, 1, 1, 0, 1, 1, 1, 0, 0,
        0, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0
    };

  //  NSString *stgNum;
  //  stgNum = [NSString stringWithFormat:@"stg%d", stg];
    
    if(stg == 1){
        memcpy(temp, stg1, sizeof(int)*100); 
    }
    else if(stg == 2){
        memcpy(temp, stg2, sizeof(int)*100); 
    }
    else if(stg == 3){
        memcpy(temp, stg3, sizeof(int)*100); 
    }
    else if(stg == 4){
        memcpy(temp, stg4, sizeof(int)*100); 
    }
    else if(stg == 5){
        memcpy(temp, stg5, sizeof(int)*100); 
    }
    else if(stg == 6){
        memcpy(temp, stg6, sizeof(int)*100); 
    }
    else if(stg == 7){
        memcpy(temp, stg7, sizeof(int)*100); 
    }
    else if(stg == 8){
        memcpy(temp, stg8, sizeof(int)*100); 
    }
    else if(stg == 9){
        memcpy(temp, stg9, sizeof(int)*100); 
    }
              
    /*
    temp = malloc(sizeof(int)*100);
    int stg[10][10]={
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
        0, 0, 1, 1, 0, 1, 1, 1, 0, 0,
        0, 1, 1, 1, 1, 1, 1, 1, 1, 0,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1,
        0, 1, 1, 1, 1, 1, 1, 1, 1, 0,
        0, 0, 1, 1, 1, 1, 1, 1, 0, 0
    };
    
    memcpy(temp, stg, sizeof(int)*100);  */

    return temp;
}

-(NSString *) getLabelRow{
    
    stgLabelRow[0] = [NSString stringWithString:@""];
    
    
}
-(void) setStgFlg1:(int)flg{
    
    stgClearFlg[0] = flg;
}

-(int) getStgFlg1{
    
    return stgClearFlg[0];
}

-(void) setStgFlg2:(int)flg{
    
    stgClearFlg[1] = flg;
}

-(int) getStgFlg2{
    
    return stgClearFlg[1];
}

-(void) setStgFlg3:(int)flg{
    
    stgClearFlg[2] = flg;
}

-(int) getStgFlg3{
    
    return stgClearFlg[2];
}

-(void) setStgFlg4:(int)flg{
    
    stgClearFlg[3] = flg;
}

-(int) getStgFlg4{
    
    return stgClearFlg[3];
}

-(void) setStgFlg5:(int)flg{
    
    stgClearFlg[4] = flg;
}

-(int) getStgFlg5{
    
    return stgClearFlg[4];
}

-(void) setStgFlg6:(int)flg{
    
    stgClearFlg[5] = flg;
}

-(int) getStgFlg6{
    
    return stgClearFlg[5];
}

-(void) setStgFlg7:(int)flg{
    
    stgClearFlg[6] = flg;
}

-(int) getStgFlg7{
    
    return stgClearFlg[6];
}

-(void) setStgFlg8:(int)flg{
    
    stgClearFlg[7] = flg;
}

-(int) getStgFlg8{
    
    return stgClearFlg[7];
}

-(void) setStgFlg9:(int)flg{
    
    stgClearFlg[8] = flg;
}

-(int) getStgFlg9{
    
    return stgClearFlg[8];
}

-(void) dealloc{
    
    free(temp);
    [super dealloc];
}

@end
