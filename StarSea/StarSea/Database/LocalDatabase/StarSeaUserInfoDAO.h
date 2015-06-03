//
//  StarSeaUserInfoDAO.h
//  StarSea
//
//  Created by WayneLiu on 15/6/2.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "UserInfo.h"
#import "DBBaseDAO.h"
@interface StarSeaUserInfoDAO : DBBaseDAO
+ (StarSeaUserInfoDAO *)shareManager;

//插入Note方法
-(int) create:(UserInfo *)model;

//删除Note方法
-(int) remove;

//查询所有数据方法（只有一条数据，直接返回一个ISwustUserInfo对象）
-(UserInfo *) findAll;



@end
