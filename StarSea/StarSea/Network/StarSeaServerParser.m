//
//  StarSeaServerParser.m
//  StarSea
//
//  Created by WayneLiu on 15/5/7.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "StarSeaServerParser.h"
#import "StarSeaServerInterface.h"
#import "StarSeaUserInfoBL.h"


//
#import "Tools.h"
//#import "StarSeaServerHttpRequest.h"

@implementation StarSeaServerParser
{
    StarSeaServerInterface *_sasInterface;
}
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _array = [NSArray arrayWithObjects:@"SUCCESS",@"FAIL",@"USER_NOT_LOGIN",@"USER_ACCONUT_EXIST",@"USER_PASSWD_WRONG",@"ACCESS_DENIED",@"REQUEST_TIMEOUT",@"REQUEST_FREQUENT",@"ENCODING_WRONG",@"SERVER_UNAVAILABLE",@"PARAMETER_ERROR",@"USER_ACCOUNT_NOT_EXIST",@"USER_NAME_WRONG",@"USER_FRIEND_ACCOUNT_NOT_EXIST", nil];
    }
    return self;
}


-(NSString *)errorStatusNotification:(int)status
{
    
    switch (status) {
        case 0:
            return @"成功";
            break;
        case 1:
            return @"操作失败，请重试";
            break;
        case 2:
            return @"用户未登录";
            break;
        case 3:
            return @"用户已存在,请登录";
            break;
        case 4:
            return @"用户密码错误";
            break;
        case 5:
            return @"用户无权限访问";
            break;
        case 6:
            return @"请求超时";
            break;
        case 7:
            return @"用户提交过于频繁，请稍后访问";
            break;
        case 8:
            return @"编码错误";
            break;
        case 9:
            return @"服务不可用";
            break;
        case 10:
            return @"参数错误";
            break;
        case 11:
            return @"用户账户不存在";
            break;
        case 12:
            return @"用户名错误";
            break;
        case 13:
            return @"用户好友帐号不存在";
            break;
            
        default:
            break;
    }
    return nil;
    
}


-(void)sasRegister:(NSData *)jsonData
{
     NSError *error;
    NSDictionary *allInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    
    //[Tools jsonSerialization:allInfo];
    NSString *statusKey =  [allInfo objectForKey:@"status"];
    int statusIndex = [_array indexOfObject:statusKey];
   // NSUInteger statusIndex1 = [_array indexOfObject:statusKey];
    
    //测试输出数据
    NSString *string = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"string == %@",string);

    
    if (statusIndex == 0) {
        //        //仅仅登录
        //        _iSwustLoginServer = [ISwustLoginHttpRequest new];
        //        [_iSwustLoginServer justiSwustLoginHttpRequest];
        
        /**
         注册成功，将返回数据插入个人信息数据库
         */
        
//        StarSeaUserInfoBL *starseaUserInfoBL = [[StarSeaUserInfoBL alloc]init];
//        [starseaUserInfoBL inSertData:allInfo];
        
        NSLog(@"注册成功");
    }else{
        
        NSLog(@"注册失败");
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StarSea_Register_Notice" object:nil userInfo:[NSDictionary dictionaryWithObject:[self errorStatusNotification:statusIndex] forKey:@"Message"]];
}

-(void)sasLogin:(NSData *)jsonData
{
    NSError *error;
    NSDictionary *allInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];

    NSString *statusKey =  [allInfo objectForKey:@"status"];
    int statusIndex = [_array indexOfObject:statusKey];
    // NSUInteger statusIndex1 = [_array indexOfObject:statusKey];

    //测试输出数据
    NSString *string = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"string == %@",string);
    
    
    if (statusIndex == 0) {
        //        //仅仅登录
        //        _iSwustLoginServer = [ISwustLoginHttpRequest new];
        //        [_iSwustLoginServer justiSwustLoginHttpRequest];
        
        /**
         注册成功，将返回数据插入个人信息数据库
         */
        
        //        StarSeaUserInfoBL *starseaUserInfoBL = [[StarSeaUserInfoBL alloc]init];
        //        [starseaUserInfoBL inSertData:allInfo];
        
        NSLog(@"登录成功");
    }else{
        
        NSLog(@"登录失败");
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StarSea_Login_Notice" object:nil userInfo:[NSDictionary dictionaryWithObject:[self errorStatusNotification:statusIndex] forKey:@"Message"]];

}

@end
