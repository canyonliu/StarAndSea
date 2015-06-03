//
//  DBHelper.m
//  StarSea
//
//  Created by WayneLiu on 15/5/17.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "DBHelper.h"


@implementation DBHelper

+(NSString *)applicationDocumentsDirectoryFile:(NSString *)fileName
{//获取到documents 的文件目录
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:fileName];
    
    return  path;
}

+(NSString *)applicationShareDirectoryFile
{
    NSURL *containerURL = [[NSFileManager defaultManager]containerURLForSecurityApplicationGroupIdentifier:@"group.StarSea"];
    containerURL = [containerURL URLByAppendingPathComponent:@"Library/Caches/StarSea.sqlite"];
    NSString *dbFilePath = [containerURL absoluteString];
    
    return dbFilePath;
}

-(void)initHostDataBase
{
    NSString *dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
    NSFileManager *fileMger = [NSFileManager defaultManager];
    
    if([fileMger fileExistsAtPath:dbFilePath] == NO)
    {
        if(sqlite3_open([dbFilePath UTF8String], &db) != SQLITE_OK)
        {
            sqlite3_close(db);
            NSAssert(NO, @"数据库创建时打开失败..");
            
        }
        else
        {
            //建表
            [self creatUserInfo];
            
            //关闭数据库
            sqlite3_close(db);
        }
    }
}

-(void)creatNoticeTable
{
    NSString *sql_stmtPersonal = @"CREATE TABLE IF NOT EXISTS NOTICE_PERSONAL(INVITED_NAME TEXT ,INVITED_TIME TEXT, INVITED_SITE TEXT,INVITED_PERSONPIC TEXT,INVITEDD_DETAILTIME TEXT";
    if(sqlite3_exec(db , [sql_stmtPersonal UTF8String], NULL, NULL, NULL)!= SQLITE_OK)
    {
        LQCLog(@"通知的 person 建表失败!");
    }
}

-(void)creatUserInfo
{
    NSString *sql_stmtPersonal = @"CREATE TABLE IF NOT EXISTS NOTICE_PERSONAL(USER_ID TEXT ,USER_HEADPIC TEXT, USER_PHONE TEXT,USER_PASSWORD TEXT,USER_NAME TEXT)";
    if(sqlite3_exec(db , [sql_stmtPersonal UTF8String], NULL, NULL, NULL)!= SQLITE_OK)
    {
        LQCLog(@"个人信息表 建表失败!");
    }
}



@end
