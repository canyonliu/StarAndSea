//
//  StarSeaServerHttpRequest.m
//  StarSea
//
//  Created by WayneLiu on 15/5/7.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "StarSeaServerHttpRequest.h"

@implementation StarSeaServerHttpRequest

-(void)startStarSeaServerHttpRequest_WithDict:(NSDictionary *)dict ActionURL:(StarSea_ServerIndex)actionIndex
{
    @try {
        __weak ASIFormDataRequest *requestRegister = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_SAS_ServerMajorDomain,[self findActionURL:actionIndex]]]];
        
        [requestRegister setPostValue:dict forKey:@"params"];
        
        [requestRegister setCompletionBlock:^{
            [self responseServer:[requestRegister responseData] andActionIndex:actionIndex];
        }];
        [requestRegister setFailedBlock:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"StarSea_Request_Notice" object:nil userInfo:[NSDictionary dictionaryWithObject:@"接口请求异常" forKey:@"Message"]];
            NSLog(@"用户请求错误：%s:error == %@",__FUNCTION__,requestRegister.error);
        }];
        [requestRegister startAsynchronous];

    }
    @catch (NSException *exception) {
        NSLog(@"%s:%@",__FUNCTION__,exception);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"StarSea_Request_Notice" object:nil userInfo:[NSDictionary dictionaryWithObject:@"接口请求异常" forKey:@"Message"]];

    }
    @finally {
        
    }
}


//根据动作来确定要执行哪一个解析
-(void)responseServer:(NSData *)jsonData andActionIndex:(StarSea_ServerIndex)actionIndex
{
    if(parser ==nil){
        parser = [[StarSeaServerParser alloc]init];
    }
    
    switch (actionIndex) {
        case SAS_Register:
            //[parser sasRegister:jsonData];
            break;
        case SAS_Login:
            
            break;
        case SAS_SynchUserInfo:
            
            break;
        case SAS_ChangePassword:
           
            break;
        case SAS_FindPassword:
            
            break;
        case SAS_UploadPicture:
            
            break;
        case SAS_Feedack:
            
            break;
        case SAS_logout:
            
            break;
        case SAS_GetUserinfo:
            
            break;
        case SAS_SynchProxy:
           
            break;
        case SAS_SynchSystemAccount:
            
            break;
        case SAS_AddNotes:
            
            break;
        case SAS_GetAllNotes:
            
            break;

        default:
            break;
    }
    
    
        
}

//判断是哪一个接口动作
-(NSString *)findActionURL:(StarSea_ServerIndex)actionIndex
{
    NSString *actionURL;
    switch (actionIndex) {
        case SAS_Register:
            return URL_SAS_Register;
            break;
        case SAS_Login:
            return URL_SAS_Login;
            break;
        case SAS_SynchUserInfo:
            return URL_SAS_SynchUserInfo;
            break;
        case SAS_ChangePassword:
            return URL_SAS_ChangePassword;
            break;
        case SAS_FindPassword:
            return URL_SAS_FindPassword;
            break;
        case SAS_UploadPicture:
            return URL_SAS_UploadPicture;
            break;
        case SAS_Feedack:
            return URL_SAS_Feedack;
            break;
        case SAS_logout:
            return URL_SAS_logout;
            break;
        case SAS_GetUserinfo:
            return URL_SAS_GetUserinfo;
            break;
        case SAS_SynchProxy:
            return URL_SAS_SynchProxy;
            break;
        case SAS_SynchSystemAccount:
            return URL_SAS_SynchSystemAccount;
            break;
        case SAS_AddNotes:
            return URL_SAS_AddNotes;
            break;
        case SAS_GetAllNotes:
            return URL_SAS_GetAllNotes;
            break;
            
        default:
            break;
    }
    
    return actionURL;
}



@end


