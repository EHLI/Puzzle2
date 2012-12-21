//
//  VarStore.h
//  Puzzle2
//
//  Created by Jenny Kim on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VarStore : NSObject
{
    // "Global" variables //
    
    int stgClearFlg[9];
    int stgSelected;
    
    
    // Stage Labels //
    NSString *labelRow;
    NSString *stgLabelRow[9];
    NSString *stgLabelCol[9];
    
    int *temp;
        
}

@property (nonatomic, assign) int stgSelected;
@property (readonly) int *temp;
@property (readonly) NSString *labelRow;





+ (VarStore *)sharedInstance;
-(void) setStgSelected:(int)stg;
-(int *) getStgArr:(int)stg;
-(NSString *) getLabelRow;
-(int) getStgSelected;
-(void) setStgFlg1:(int)flg;
-(int) getStgFlg1;
-(void) setStgFlg2:(int)flg;
-(int) getStgFlg2;
-(void) setStgFlg3:(int)flg;
-(int) getStgFlg3;
-(void) setStgFlg4:(int)flg;
-(int) getStgFlg4;
-(void) setStgFlg5:(int)flg;
-(int) getStgFlg5;
-(void) setStgFlg6:(int)flg;
-(int) getStgFlg6;
-(void) setStgFlg7:(int)flg;
-(int) getStgFlg7;
-(void) setStgFlg8:(int)flg;
-(int) getStgFlg8;
-(void) setStgFlg9:(int)flg;
-(int) getStgFlg9;


@end
