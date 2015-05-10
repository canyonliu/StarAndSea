//
//  RegisterDetailViewController.h
//  StarSea
//
//  Created by WayneLiu on 15/5/10.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterDetailViewController : UIViewController<UIAlertViewDelegate>
//用户注册手机号码
@property(nonatomic ,strong)NSString *userPhoneNum;

@property (weak, nonatomic) IBOutlet UITextField *verifyCodeField;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *repeatSMSBtn;

- (IBAction)notReceiveSmsBtn:(id)sender;

@end
