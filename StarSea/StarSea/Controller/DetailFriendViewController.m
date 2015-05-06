//
//  DetailFriendViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/2.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "DetailFriendViewController.h"

@interface DetailFriendViewController ()

@end

@implementation DetailFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好友详细界面";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SendNotification:(id)sender {
    
}


- (IBAction)TakeAPhone:(id)sender {
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSURL *telURL =[NSURL URLWithString:@"tel:10086"];// 貌似tel:// 或者 tel: 都行
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //记得添加到view上
    [self.view addSubview:callWebview];
}


@end
