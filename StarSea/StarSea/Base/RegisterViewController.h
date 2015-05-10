//
//  RegisterViewController.h
//  StarSea
//
//  Created by WayneLiu on 15/5/6.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
- (IBAction)backToLoginVC;
- (IBAction)jumpToRegisterDetailView;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;


@end
