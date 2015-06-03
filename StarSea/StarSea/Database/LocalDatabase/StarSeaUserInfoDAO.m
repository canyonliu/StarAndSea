//
//  StarSeaUserInfoDAO.m
//  StarSea
//
//  Created by WayneLiu on 15/6/2.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "StarSeaUserInfoDAO.h"


@implementation StarSeaUserInfoDAO
static StarSeaUserInfoDAO *shareManager = nil;

+ (StarSeaUserInfoDAO *)shareManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        shareManager = [[super alloc]init];
    });
    return shareManager;
}



//插入方法
-(int) create:(UserInfo *)model{
    
    if ([self openDB]) {
        
        NSString *sqlStr = @"INSERT INTO STARSEA_USER_INFO(user_id,user_headPic ,user_password ,user_name ,user_phone) VALUES (?,?,?,?,?)";
        NSLog(@"进入插入个人数据\n");
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_text(statement, 1, [model.name UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.phoneNum UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.userId UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.userPic UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 5, [model.password UTF8String], -1, NULL);
      
            
            //执行插入
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"插入个人信息数据失败。");
            }
            else{
                //NSLog(@"courseTable inserted!");
            }
        }
        else{
            NSLog(@"插入数据失败");
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return 0;
}

//删除方法
-(int) remove{
    NSLog(@"STARSEA_USER_INFO remove success");
    if ([self openDB]) {
        
        NSString *sqlStr = @"DELETE from STARSEA_USER_INFO";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            
            //执行
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"删除个人信息数据失败。");
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    
    return 0;
}

//查询所有数据方法
-(UserInfo *) findAll{
    
    UserInfo *UserInfoItem = [[UserInfo alloc] init];
    if ([self openDB]) {
        
        NSString *qsql = @"SELECT user_name ,user_signature ,nick_name ,user_photo_link ,user_sex ,user_idcard ,user_qq ,user_email,user_tel,user_bedroom,user_hometown,user_college,user_class,user_birthday,user_capacity,user_number,user_education,user_professional FROM ISWUST_USER_INFO";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //执行
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                
                
                char *user_name = (char *) sqlite3_column_text(statement, 0);
                UserInfoItem.name = [[NSString alloc] initWithUTF8String:user_name];
                
                char *user_id = (char *) sqlite3_column_text(statement, 1);
                UserInfoItem.userId = [[NSString alloc] initWithUTF8String: user_id];
                
                char *user_pic = (char *) sqlite3_column_text(statement, 2);
                UserInfoItem.userPic = [[NSString alloc] initWithUTF8String: user_pic];
                
                char *user_phoneNum = (char *) sqlite3_column_text(statement, 3);
                UserInfoItem.phoneNum = [[NSString alloc] initWithUTF8String: user_phoneNum];
                
                char *user_password = (char *) sqlite3_column_text(statement, 4);
                UserInfoItem.password = [[NSString alloc] initWithUTF8String:user_password];
                
                
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return UserInfoItem;
    
}


@end
