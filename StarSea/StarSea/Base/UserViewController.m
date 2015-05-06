//
//  UserViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/5.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "UserViewController.h"
#import "Tools.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    [self setupUserUrbanUI];
    
}


-(void)setupUserUrbanUI
{
    self.userHeadPic.image = [UIImage imageNamed:@"cluo1"];
    [Tools ChoosenImageViewChangeModelToCircle:self.userHeadPic];
    self.userName.text = @"克里斯蒂亚诺";
    self.userPhoneNumber.text = @"0813-123654780";
}

@end
