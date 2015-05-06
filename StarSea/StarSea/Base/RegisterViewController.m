//
//  RegisterViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/6.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (IBAction)backToLoginVC {
    //[self popoverPresentationController];
    //NSLog(@"ssss");
    //[self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    //[self.navigationController popoverPresentationController];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
