//
//  VVCsql.h
//  testt
//
//  Created by victerio on 7/6/13.
//  Copyright (c) 2013 victerio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Param.h"

@interface VVCsql : NSObject{}
@property sqlite3 *mybase;
-(void) test3:(NSMutableArray*)names :(NSMutableArray*) values;
-(void) test2:(NSMutableArray*)names :(NSMutableArray*) values;
-(void) test1 :(Param*) p;

@end
