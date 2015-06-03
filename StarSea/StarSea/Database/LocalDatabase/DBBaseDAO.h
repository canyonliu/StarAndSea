//
//  DBBaseDAO.h
//  StarSea
//
//  Created by WayneLiu on 15/5/17.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBHelper.h"
#import "sqlite3.h"


@interface DBBaseDAO : NSObject
{
    sqlite3 *db;
}

//数据文件全路径
@property(nonatomic,strong)NSString *dbFilePath;

//打开SQLite数据库 true 打开成功 false 打开失败
-(BOOL)openDB;

@end
