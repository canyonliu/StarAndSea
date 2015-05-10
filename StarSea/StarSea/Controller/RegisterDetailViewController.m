//
//  RegisterDetailViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/10.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "RegisterDetailViewController.h"

//#import "SMS_MBProgressHUD+Add.h"
#import <AddressBook/AddressBook.h>
#import "ViewController.h"
//#import "RegisterByVoiceCallViewController.h"

#import <SMS_SDK/SMS_SDK.h>
#import <SMS_SDK/SMS_UserInfo.h>
#import <SMS_SDK/SMS_AddressBook.h>

static int count = 0;


@interface RegisterDetailViewController ()
{
    NSTimer* _timer1;
    NSTimer* _timer2;
    
    UIAlertView* _alert1;
    UIAlertView* _alert2;
    UIAlertView* _alert3;
    
    UIAlertView *_tryVoiceCallAlertView;
}

@property (weak, nonatomic) IBOutlet UILabel *userWillRegisterPhoneNum;


- (IBAction)registerBtn:(id)sender;
- (IBAction)backToLoginVC;

@end

@implementation RegisterDetailViewController
@synthesize userPhoneNum;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userWillRegisterPhoneNum.text = userPhoneNum;
    [self setupTimeAndRepeat];
    //设置返回按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(backToLoginVC)];
    self.navigationItem.leftBarButtonItem = leftItem;
    //设置标题(使用Tools)
    self.navigationController.title = @"电话注册";
    LQCLog(@"传过来的number:%@",userPhoneNum);
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden = NO;
}


-(void)setupTimeAndRepeat
{
    [_repeatSMSBtn addTarget:self action:@selector(CannotGetSMS) forControlEvents:UIControlEventTouchUpInside];
    _repeatSMSBtn.hidden=YES;
    count = 0;
    
    
    NSTimer* timer=[NSTimer scheduledTimerWithTimeInterval:60
                                                    target:self
                                                  selector:@selector(showRepeatButton)
                                                  userInfo:nil
                                                   repeats:YES];
    
    NSTimer* timer2=[NSTimer scheduledTimerWithTimeInterval:1
                                                     target:self
                                                   selector:@selector(updateTime)
                                                   userInfo:nil
                                                    repeats:YES];
    _timer1=timer;
    _timer2=timer2;

}
-(void)updateTime
{
    count++;
    if (count>=60)
    {
        [_timer2 invalidate];
        return;
    }
    //NSLog(@"更新时间");
    self.timeLabel.text=[NSString stringWithFormat:@"%is后重发",60-count];
}

-(void)showRepeatButton{
    self.timeLabel.hidden=YES;
    self.repeatSMSBtn.hidden=NO;
    
    [_timer1 invalidate];
    return;
}
-(void)CannotGetSMS
{
    NSString* str=[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"cannotgetsmsmsg", nil) ,self.userPhoneNum];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"surephonenumber", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", nil) otherButtonTitles:NSLocalizedString(@"sure", nil), nil];
    _alert1=alert;
    [alert show];
}



- (IBAction)registerBtn:(id)sender {
    LQCLog(@"click----%s",__FUNCTION__);
    
    //验证号码
    //验证成功后 获取通讯录 上传通讯录
    [self.view endEditing:YES];
    
    if(self.verifyCodeField.text.length!=4)
    {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil)
                                                      message:NSLocalizedString(@"verifycodeformaterror", nil)
                                                     delegate:self
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        //[[SMS_SDK sharedInstance] commitVerifyCode:self.verifyCodeField.text];
        [SMS_SDK commitVerifyCode:self.verifyCodeField.text result:^(enum SMS_ResponseState state) {
            if (1==state)
            {
                NSLog(@"验证成功");
                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"verifycoderightmsg", nil)];
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"verifycoderighttitle", nil)
                                                              message:str
                                                             delegate:self
                                                    cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                    otherButtonTitles:nil, nil];
                [alert show];
                _alert3=alert;
            }
            else if(0==state)
            {
                NSLog(@"验证失败");
                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"verifycodeerrormsg", nil)];
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"verifycodeerrortitle", nil)
                                                              message:str
                                                             delegate:self
                                                    cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                    otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
    }

    
    
}

- (IBAction)backToLoginVC {
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil)
                                                  message:NSLocalizedString(@"codedelaymsg", nil)
                                                 delegate:self
                                        cancelButtonTitle:NSLocalizedString(@"back", nil)
                                        otherButtonTitles:NSLocalizedString(@"wait", nil), nil];
    _alert2 = alert;
    [alert show];
    
    LQCLog(@"click---%s",__FUNCTION__);
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView==_alert1)
    {
        if (1==buttonIndex)
        {
            NSLog(@"重发验证码");
            [SMS_SDK getVerifyCodeByPhoneNumber:self.userPhoneNum AndZone:@"86" result:^(enum SMS_GetVerifyCodeResponseState state)
             {
                 if (1==state)
                 {
                     NSLog(@"block 获取验证码成功");
                 }
                 else if(0==state)
                 {
                     NSLog(@"block 获取验证码失败");
                     NSString* str=[NSString stringWithFormat:NSLocalizedString(@"codesenderrormsg", nil)];
                     UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
                     [alert show];
                 }
                 else if (SMS_ResponseStateMaxVerifyCode==state)
                 {
                     NSString* str=[NSString stringWithFormat:NSLocalizedString(@"maxcodemsg", nil)];
                     UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"maxcode", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
                     [alert show];
                 }
                 else if(SMS_ResponseStateGetVerifyCodeTooOften==state)
                 {
                     NSString* str=[NSString stringWithFormat:NSLocalizedString(@"codetoooftenmsg", nil)];
                     UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
                     [alert show];
                 }
                 
             }];
            
        }
        
    }
    
    if (alertView==_alert2) {
        if (0==buttonIndex)
        {
            [self dismissViewControllerAnimated:YES completion:^{
                [_timer2 invalidate];
                [_timer1 invalidate];
            }];
        }
    }
    
    if (alertView==_alert3)
    {
        ViewController* mianVC= [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MainVC"];
        

        
//        [[[[UIApplication sharedApplication] keyWindow] rootViewController] dismissViewControllerAnimated:YES completion:^(void){
//            [_timer2 invalidate];
//            [_timer1 invalidate];
//
//        }];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
//        [self.navigationController presentViewController:mianVC animated:YES completion:^{
//            //解决等待时间乱跳的问题
//            [_timer2 invalidate];
//            [_timer1 invalidate];
//        }];
        //self.navigationController.navigationBar.hidden = NO;
    }
    
    if (alertView == _tryVoiceCallAlertView)
    {
        if (0 ==buttonIndex)
        {
            [SMS_SDK getVerificationCodeByVoiceCallWithPhone:self.userPhoneNum
                                                        zone:@"86"
                                                      result:^(SMS_SDKError *error)
             {
                 
                 if (error)
                 {
                     UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                                   message:[NSString stringWithFormat:@"状态码：%zi",error.errorCode]
                                                                  delegate:self
                                                         cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                         otherButtonTitles:nil, nil];
                     [alert show];
                 }
             }];
        }
    }
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (IBAction)notReceiveSmsBtn:(id)sender {
    LQCLog(@"clicked---%s",__FUNCTION__);
}
@end
