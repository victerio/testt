//
//  VVCsql.m
//  testt
//
//  Created by victerio on 7/6/13.
//  Copyright (c) 2013 victerio. All rights reserved.
//

#import "VVCsql.h"

@implementation VVCsql
@synthesize mybase;

-(void) test2 :(NSMutableArray*)names :(NSMutableArray*) values {
    int err;
    sqlite3_stmt *Stmt1=nil;
    NSString *b = @"/users/shared/test.db";
    const char *b8 = [b UTF8String];
    if((err=sqlite3_open(b8,&mybase))!=SQLITE_OK) return;
        NSString *query1=@"select * from contacts";
    const char *que_con =[query1 UTF8String];
    if((err=sqlite3_prepare_v2(mybase, que_con, -1, &Stmt1, NULL))==SQLITE_OK){
        while(sqlite3_step(Stmt1)==SQLITE_ROW) {
            NSString *cn0 = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(Stmt1, 2)];
        [names addObject:cn0];
            NSString *cn = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(Stmt1, 1)];
        [values addObject:cn];
        }
    }
    sqlite3_close(mybase);
}
-(void) test1 :(Param*) p
{    
    int err;
    sqlite3_stmt *Stmt=nil;
    NSString *b = @"/users/shared/test.db";
    const char *b8 = [b UTF8String];
    if((err=sqlite3_open(b8,&mybase))==SQLITE_OK) {

    NSString *query =@"select * from mydata where id=2;";
        const char *queryUTF = [query UTF8String];
        if((err=sqlite3_prepare_v2(mybase, queryUTF, -1, &Stmt, NULL))==SQLITE_OK){
            if(sqlite3_step(Stmt)==SQLITE_ROW) {
            NSString *nm=
                 [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(Stmt, 1)];
                p->nm = [NSString stringWithFormat:@"%@",nm];               p->bdate= [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(Stmt, 2)];
                int len=sqlite3_column_bytes(Stmt, 3);
                p->pi= [NSData dataWithBytes:sqlite3_column_blob(Stmt,3) length:len];
            }
            else {NSLog(@"not ok");}
       }else {NSLog(@"not ok %s",sqlite3_errmsg(mybase));}
        sqlite3_finalize(Stmt);
             sqlite3_close(mybase);
    } else {NSLog(@"db code is %d",err);}
}
-(void) test3 :(NSMutableArray*)names :(NSMutableArray*) values {
    int err;
    sqlite3_stmt *Stmt2=nil;
    NSString *b = @"/users/shared/test.db";
    const char *b8 = [b UTF8String];
    if((err=sqlite3_open(b8,&mybase))!=SQLITE_OK) return;
    NSString *query1=@"select * from bio";
    const char *que_con =[query1 UTF8String];
    if((err=sqlite3_prepare_v2(mybase, que_con, -1, &Stmt2, NULL))==SQLITE_OK){
        while(sqlite3_step(Stmt2)==SQLITE_ROW) {
            NSString *cn0 = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(Stmt2, 2)];
            [names addObject:cn0];
            NSString *cn = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(Stmt2, 1)];
            [values addObject:cn];
        }
    }
    sqlite3_close(mybase);
}

@end
