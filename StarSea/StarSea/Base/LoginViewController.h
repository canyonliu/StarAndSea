//
//  LoginViewController.h
//  StarSea
//
//  Created by WayneLiu on 15/5/6.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *LoginHeadPic;
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;
//- (IBAction)PresentToRegisterVC;
- (IBAction)LoginBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;

@end
