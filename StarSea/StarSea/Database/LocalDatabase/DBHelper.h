//
//  DBHelper.h
//  StarSea
//
//  Created by WayneLiu on 15/5/17.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DBHelper : NSObject
{
    sqlite3 *db;
}

//获得沙箱Document目录下全路径
+(NSString *)applicationDocumentsDirectoryFile:(NSString *)fileName;

//获得share中目录下全路径
+(NSString *)applicationShareDirectoryFile;

//初始化主程序数据库（建表）
-(void)initHostDataBase;





@end
