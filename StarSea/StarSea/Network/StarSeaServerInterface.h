//
//  StarSeaServerInterface.h
//  StarSea
//
//  Created by WayneLiu on 15/5/7.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StarSeaServerHttpRequest.h"
#import "Tools.h"


@interface StarSeaServerInterface : NSObject
{
    StarSeaServerHttpRequest *_httpRequest;
}

/**
 *  @author LQC
 *
 *  注册
 *
 *  @param registername 注册姓名
 *  @param phoneNumber  注册电话
 *  @param passWord     密码
 */
-(void)StarSea_Register_Registername:(NSString *)registername phoneNumber:(NSString *)phoneNumber passWord:(NSString *)passWord;


@end
