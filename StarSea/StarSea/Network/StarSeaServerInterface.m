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
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[registername,phoneNumber,passWord] forKeys:@[@"user_name",@"user_phone",@"user_password"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_Register
     ];

}


-(void)StarSea_Login_LoginphoneNumber:(NSString *)phoneNumber passWord:(NSString *)passWord
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[phoneNumber,passWord] forKeys:@[@"user_phone",@"user_password"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_Login
     ];

}

//*************************************测接口时注意检查ActionURl是否正确***************************/
-(void)StarSea_FindPassword_withPhoneNumber:(NSString *)phoneNumber
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[phoneNumber] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_FindPassword
     ];
}

-(void)StarSea_FindAndChangePassword_withPhoneNumber:(NSString *)phoneNumber andUserNewPassword:(NSString *)newPassword
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[phoneNumber,newPassword] forKeys:@[@"user_phone",@"new_password"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_ChangePassword
     ];
}


-(void)StarSea_ChangePhoneNumber_withOldPhoneNumber:(NSString *)oldPhoneNumber andUserNewPhoneNumber:(NSString *)newPhoneNumber
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[oldPhoneNumber,newPhoneNumber] forKeys:@[@"old_phone",@"new_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_ChangePhoneNumber
     ];
}


-(void)StarSea_ChangePassword_withNewPhoneNumber:(NSString *)newPhoneNumber
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[newPhoneNumber] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_ChangePassword
     ];

}



-(void)StarSea_Syncdata_withPhoneNumber:(NSString *)phoneNumber andAppVersion:(NSString *)appversion andDeviceSystem:(NSString *)deviceSystem
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[phoneNumber,appversion,deviceSystem] forKeys:@[@"user_phone",@"appversion",@"devicesystem"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_SynchData
     ];

}

//使用dictionaryWithObjectsAndKeys方法存储数据时，中间任何一个对象都不能为nil,否则它后面都对象都无法存入aFiledic。因为dictionaryWithObjectsAndKeys方法是以nil结尾的。所以，只要见到nil,此方法就认为结束了。

-(void)StarSea_Validatecode
{
    [_httpRequest startStarSeaServerHttpRequest_WithDict:nil ActionURL:SAS_ValidateCode
     ];

}

-(void)StarSea_Loginout
{
    [_httpRequest startStarSeaServerHttpRequest_WithDict:nil ActionURL:SAS_logout
     ];

}

-(void)AddFriend_withFriendPhoneNumber:(NSString *)friendNumber
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[friendNumber] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_AddFriend
     ];

}


-(void)DeleteFriend_withFriendPhoneNumber:(NSString *)friendNumber
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[friendNumber] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_DeleteFriend
     ];
}

-(void)SendNotice_withSendPhoneNumber:(NSString *)sendPhoneNumber andAcceptNoticePhoneNumber:(NSString *)noticeNumber andNoteType:(int)noteType andNoteBackground:(NSString *)background andNoteContent:(NSString *)noteContent andSendTime:(NSString *)sendTime
{
    NSNumber *noteTypeInt = [NSNumber numberWithInt:noteType];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[sendPhoneNumber,noticeNumber,noteTypeInt,background,noteContent,sendTime] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_SendNotice
     ];

}

-(void)Acceptnote
{
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:nil ActionURL:SAS_AcceptNotice
     ];

}

-(void)NoticeFeedBack_withSendPhoneNumber:(NSString *)sendPhoneNumber andAcceptNoticePhoneNumber:(NSString *)acceptPhoneNumber andNoticeFeedbackContent:(NSString *)noticeFeedbackContent andFeedbackAttitude:(BOOL)feedbackAttitude andFeedTime:(NSString *)feedback_time
{
    NSNumber *feedBackattitudeBool = [NSNumber numberWithBool:feedbackAttitude];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[sendPhoneNumber,acceptPhoneNumber,noticeFeedbackContent,feedBackattitudeBool,feedback_time] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_NoticeFeedBack
     ];
}

-(void)Acceptnotefeed
{
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:nil ActionURL:SAS_AcceptNoticeFeed
     ];

}

-(void)ShowNotice
{
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:nil ActionURL:SAS_ShowNotice
     ];

}

-(void)Userfeedback_withPhoneNumber:(NSString *)phoneNumber andAppVersion:(NSString *)appversion andPhoneModel:(NSString *)phoneModel andSystmVertion:(NSString *)systemVertion andUserFeedbackContent:(NSString *)userFeedback
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[phoneNumber,appversion,phoneModel,systemVertion,userFeedback] forKeys:@[@"user_phone"]];
    //调用与服务器交互的接口
    
    [_httpRequest startStarSeaServerHttpRequest_WithDict:dict ActionURL:SAS_UserFeedback
     ];

}

@end
