//
//  RegisterViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/6.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterDetailViewController.h"

#import <SMS_SDK/SMS_SDK.h>
#import <SMS_SDK/CountryAndAreaCode.h>

@interface RegisterViewController ()<UIAlertViewDelegate>
{
    RegisterDetailViewController *registerDetailVC;
}

//@property(nonatomic,weak)NSString* _localPhoneNumber;
//@property(nonatomic,weak)NSString* _localZoneNumber;
//@property(nonatomic,weak)NSString* _appKey;
//@property(nonatomic,weak)NSString* _duid;
//@property(nonatomic,weak)NSString* _token;
//@property(nonatomic,weak)NSString* _appSecret;
//
//@property(nonatomic,weak)NSMutableArray* _areaArray;
//@property(nonatomic,weak)NSString* _defaultCode;
//@property(nonatomic,weak)NSString* _defaultCountryName;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(backToLoginVC)];
    self.navigationItem.leftBarButtonItem = leftItem;
    //设置标题(使用Tools)
    self.title = @"注册";
    

    
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//    self.navigationController.navigationBarHidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:YES];
//    self.navigationController.navigationBarHidden = NO;
//}



- (IBAction)backToLoginVC {
    //[self popoverPresentationController];
    //NSLog(@"ssss");
    [self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    //[self.navigationController popoverPresentationController];
    
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)jumpToRegisterDetailView {
    
    if (self.userPhoneNumber.text.length!=11)
    {
        //手机号码不正确
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"提示", nil)
                                                      message:NSLocalizedString(@"手机号长度为11位", nil)
                                                     delegate:self
                                            cancelButtonTitle:NSLocalizedString(@"ok", nil)
                                            otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    /**
     * 联通号段正则表达式
     */
    NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    /**
     * 电信号段正则表达式
     */
    NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    BOOL isMatch1 = [pred1 evaluateWithObject:self.userPhoneNumber.text];
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
    BOOL isMatch2 = [pred2 evaluateWithObject:self.userPhoneNumber.text];
    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    BOOL isMatch3 = [pred3 evaluateWithObject:self.userPhoneNumber.text];

    
    if (!(isMatch1 || isMatch2 || isMatch3)) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        return;
    }
    
    
    [SMS_SDK getVerificationCodeBySMSWithPhone:self.userPhoneNumber.text
                                          zone:@"86"
                                        result:^(SMS_SDKError *error)
     {
         if (!error)
         {
             registerDetailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"registerDetailVC"];
             registerDetailVC.userPhoneNum = self.userPhoneNumber.text;
             registerDetailVC.userPassword = self.userPassword.text;
             registerDetailVC.userName = self.userName.text;
             
             
             
             //[self.navigationController presentViewController:registerDetailVC animated:YES completion:nil];
             [self.navigationController pushViewController:registerDetailVC animated:YES];
         }
         else
         {
             UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                           message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                          delegate:self
                                                 cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                 otherButtonTitles:nil, nil];
             [alert show];
         }
         
     }];

    
//    NSString* str=[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"将发送短信至:", nil),self.userPhoneNumber.text];
//    //_str=[NSString stringWithFormat:@"%@",self.userPhoneNumber.text];
//    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"确定 手机号码", nil)
//                                                  message:str delegate:self
//                                        cancelButtonTitle:NSLocalizedString(@"Cancle", nil)
//                                        otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
//    [alert show];
    
}
//#pragma mark -短信验证的相关操作
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (1==buttonIndex)
    {
        
        //NSString* str2=[self.areaCodeField.text stringByReplacingOccurrencesOfString:@"+" withString:@""];
        
        [SMS_SDK getVerificationCodeBySMSWithPhone:self.userPhoneNumber.text
                                              zone:@"86"
                                            result:^(SMS_SDKError *error)
         {
             if (!error)
             {
                 registerDetailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"registerDetailVC"];
                 registerDetailVC.userPhoneNum = self.userPhoneNumber.text;
                 
                 //[self.navigationController presentViewController:registerDetailVC animated:YES completion:nil];
                 [self.navigationController pushViewController:registerDetailVC animated:YES];
             }
             else
             {
                 UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                               message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                              delegate:self
                                                     cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                     otherButtonTitles:nil, nil];
                 [alert show];
             }
             
         }];
    }
}






-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //不允许用户输入 国家码
//    if (textField ==_areaCodeField)
//    {
//        [self.view endEditing:YES];
//    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
