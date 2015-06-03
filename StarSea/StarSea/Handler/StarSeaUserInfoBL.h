//
//  StarSeaUserInfoBL.h
//  StarSea
//
//  Created by WayneLiu on 15/6/2.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StarSeaUserInfoDAO.h"
#import "UserInfo.h"
@interface StarSeaUserInfoBL : NSObject


{
    StarSeaUserInfoDAO *dao;
    UserInfo *starseaUserInfo;
}
-(UserInfo *)findData;
-(void)inSertData:(NSDictionary *)dic;
-(void)removeData;

@end
