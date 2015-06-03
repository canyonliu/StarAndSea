//
//  LoginViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/6.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "StarSeaServerInterface.h"

#import "ViewController.h"
#import "Tools.h"

@interface LoginViewController ()
{
    ViewController *mainVC;

}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLoginUrbanMsg];
    [self judgeToLogin];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden = NO;
}


-(void)setupLoginUrbanMsg
{
    self.LoginHeadPic.image = [UIImage imageNamed:@"cluo1"];
    [Tools ChoosenImageViewChangeModelToCircle:self.LoginHeadPic];
}

-(void)judgeToLogin
{

    
}



//- (IBAction)PresentToRegisterVC {
//    RegisterViewController *registerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"registerVC"];
//    [self.navigationController presentViewController:registerVC animated:YES completion:nil];
//    //[self.navigationController presentModalViewController:registerVC animated:YES];
//}


- (IBAction)LoginBtn:(id)sender {
    
    //验证成功后不用提示框;直接上传服务器就好
    StarSeaServerInterface *_StarSraServer = [StarSeaServerInterface new];
    [_StarSraServer StarSea_Login_LoginphoneNumber:self.PhoneNumber.text passWord:self.PassWord.text];
    
    
    
    mainVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MainVC"];
    /*if([self.PhoneNumber.text isEqualToString:@"lqc"] && [self.PassWord.text isEqualToString:@"123"])
    {*/

        //[self.navigationController presentViewController:mainVC animated:YES completion:nil];
        //[self presentViewController:mainVC animated:YES completion:nil];
        [self.navigationController pushViewController:mainVC animated:YES];
         NSLog(@"tiaozhuan");
   // }
   // NSLog(@"tiaozhuan23333");
    
    
  

    
    

}
@end
