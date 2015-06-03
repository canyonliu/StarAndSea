//
//  DBBaseDAO.m
//  StarSea
//
//  Created by WayneLiu on 15/5/17.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "DBBaseDAO.h"


@implementation DBBaseDAO
-(id)init
{
    self = [super init];
    if(self)
    {
        self.dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        //初始化数据库
        DBHelper *dbhelper = [DBHelper new];
        [dbhelper initHostDataBase];
        
    }
    return self;
}

-(BOOL)openDB
{
    if(sqlite3_open([self.dbFilePath UTF8String], &db) != SQLITE_OK)
    {
        sqlite3_close(db);
        return false;
    }
    return true;
}

@end
