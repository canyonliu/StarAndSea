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


/**
 *  @author LQC
 *
 *  登录
 *
 *  @param phoneNumber 电话号码
 *  @param passWord    密码   
 */
-(void)StarSea_Login_LoginphoneNumber:(NSString *)phoneNumber passWord:(NSString *)passWord;

/**
 *  @author LQC
 *
 *  密码找回之确认账号
 *
 *  @param phoneNumber 用户注册时的电话号码
 */
-(void)StarSea_FindPassword_withPhoneNumber:(NSString *)phoneNumber;



/**
 *  @author LQC
 *
 *  密码找回之重置密码
 *
 *  @param phoneNumber 电话号码
 *  @param newPassword 重置后的密码
 */
-(void)StarSea_FindAndChangePassword_withPhoneNumber:(NSString *)phoneNumber andUserNewPassword:(NSString *)newPassword;

/**
 *  @author LQC
 *
 *  更改电话号码
 *
 *  @param oldPhoneNumber 旧密码
 *  @param newPhoneNumber 新密码
 */
-(void)StarSea_ChangePhoneNumber_withOldPhoneNumber:(NSString *)oldPhoneNumber andUserNewPhoneNumber:(NSString *)newPhoneNumber;

/**
 *  @author LQC
 *
 *  更改密码（需网页验证码）
 *
 *  @param newPhoneNumber 新密码
 */
-(void)StarSea_ChangePassword_withNewPhoneNumber:(NSString *)newPhoneNumber;

/**
 *  @author LQC
 *
 *  同步数据
 *
 *  @param phoneNumber  电话号码
 *  @param appversion   手机系统版本
 *  @param deviceSystem App版本
 * result:
 user_info用户基本信息
 user_note用户日程安排
 user_friend用户好友列表
 update_version
 0：不需要更新
 1：需要更新
 */
-(void)StarSea_Syncdata_withPhoneNumber:(NSString *)phoneNumber andAppVersion:(NSString *)appversion andDeviceSystem:(NSString *)deviceSystem;


/**
 *  @author LQC
 *
 *  生成验证码
 */
-(void)StarSea_Validatecode;

/**
 *  @author LQC
 *
 *  注销
 */
-(void)StarSea_Loginout;


//*****************************************好友系统************************************//
/**
 *  @author LQC
 *
 *  添加好友
 *
 *  @param friendNumber 好友号码
 */
-(void)AddFriend_withFriendPhoneNumber:(NSString *)friendNumber;

/**
 *  @author LQC
 *
 *  删除好友
 *
 *  @param friendNumber 好友号码
 */
-(void)DeleteFriend_withFriendPhoneNumber:(NSString *)friendNumber;


//*****************************************消息系统************************************//

//noteType 是int型的,记得更改
//[NSNumber numberWithBool:aFileModel.isDownloading]
/**
 *  @author LQC
 *
 *  发送便签
 *
 *  @param sendPhoneNumber 发送者电话号码
 *  @param noticeNumber    接受者电话号码
 *  @param noteType        消息类型
 *  @param background      卡片背景
 *  @param noteContent     消息内容
 *  @param sendTime        发送时间
 */
-(void)SendNotice_withSendPhoneNumber:(NSString *)sendPhoneNumber andAcceptNoticePhoneNumber:(NSString *)noticeNumber andNoteType:(int)noteType andNoteBackground:(NSString *)background andNoteContent:(NSString *)noteContent andSendTime:(NSString *)sendTime;

/**
 *  @author LQC
 *
 *  接受便签
 */

-(void)Acceptnote;

/**
 *  @author LQC
 *
 *  发送便签反馈
 *
 *  @param sendPhoneNumber       发送者电话
 *  @param acceptPhoneNumber     接受者电话
 *  @param noticeFeedbackContent 附带一句话
 *  @param feedbackAttitude      用户态度
 *  @param feedback_time         反馈时间
 */


//feedbackAttitude是bool型,dictionary不接受这种参数

-(void)NoticeFeedBack_withSendPhoneNumber:(NSString *)sendPhoneNumber andAcceptNoticePhoneNumber:(NSString *)acceptPhoneNumber andNoticeFeedbackContent:(NSString *)noticeFeedbackContent andFeedbackAttitude:(BOOL)feedbackAttitude andFeedTime:(NSString *)feedback_time;


/**
 *  @author LQC
 *
 *  接受便签反馈
 */
-(void)Acceptnotefeed;

/**
 *  @author LQC
 *
 *  显示便签
 */
-(void)ShowNotice;



//*****************************************用户产品反馈系统******************************//

/**
 *  @author LQC
 *
 *  用户产品反馈系统
 *
 *  @param phoneNumber 发送反馈者号码
 *  @param appversion  应用版本
 *  @param phoneModel  手机型号
 *  @param systemVertion  手机系统版本
 *  @param userFeedback  反馈内容
 */
-(void)Userfeedback_withPhoneNumber:(NSString *)phoneNumber andAppVersion:(NSString *)appversion andPhoneModel:(NSString *)phoneModel andSystmVertion:(NSString *)systemVertion andUserFeedbackContent:(NSString *)userFeedback;

@end
