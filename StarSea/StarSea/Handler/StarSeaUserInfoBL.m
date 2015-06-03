//
//  StarSeaUserInfoBL.m
//  StarSea
//
//  Created by WayneLiu on 15/6/2.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "StarSeaUserInfoBL.h"

@implementation StarSeaUserInfoBL

- (instancetype)init
{
    self = [super init];
    if (self) {
        dao = [StarSeaUserInfoDAO shareManager];
        starseaUserInfo = [UserInfo new];
        
    }
    return self;
}
-(UserInfo *)findData{
    
    starseaUserInfo = [dao findAll];
    return starseaUserInfo;
    
}
-(void)inSertData:(NSDictionary *)dic{
    
    [self removeData];
    //user_id,user_headPic ,user_password ,user_name ,user_phone
    
    starseaUserInfo.name = [dic objectForKey:@"user_name"];
    starseaUserInfo.phoneNum = [dic objectForKey:@"user_phone"];
    starseaUserInfo.userId = [dic objectForKey:@"user_id"];
    starseaUserInfo.userPic = [dic objectForKey:@"user_headPic"];
    starseaUserInfo.password = [dic objectForKey:@"user_password"];

    
    [dao create:starseaUserInfo];
}
-(void)removeData{
    [dao remove];
}
@end

