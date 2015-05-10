//
//  StarSeaServerInterface.m
//  StarSea
//
//  Created by WayneLiu on 15/5/7.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "StarSeaServerInterface.h"

@implementation StarSeaServerInterface

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        if(_httpRequest == nil)
        {
            _httpRequest = [StarSeaServerHttpRequest new];
            //需不需要判断当前是否处于登录状态???????
        }
    }
    return self;
}



-(void)StarSea_Register_Registername:(NSString *)registername phoneNumber:(NSString *)phoneNumber passWord:(NSString *)passWord
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[registername,phoneNumber,passWord] forKeys:@[@"user_registername",@"user_Phonenumber",@"user_password"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_Register
     ];

}

@end
