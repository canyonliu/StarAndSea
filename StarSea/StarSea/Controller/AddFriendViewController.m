//
//  AddFriendViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/5.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "AddFriendViewController.h"
#import "SectionsViewControllerFriends.h"
#import "InvitationViewControllerEx.h"
#import <SMS_SDK/SMS_SDK.h>

@interface AddFriendViewController ()
{
    SectionsViewControllerFriends * _friendsController;
}
- (IBAction)addFriendsFromContactBook:(id)sender;

@end

@implementation AddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加联系人";
}


- (IBAction)addFriendsFromContactBook:(id)sender {

        NSLog(@"show my friends");
        //[_testView setNumber:0];
        
        SectionsViewControllerFriends* friends=[[SectionsViewControllerFriends alloc] init];
        _friendsController=friends;
        
        [_friendsController setMyBlock:friends.friendsBlock];
        
        //[SMS_MBProgressHUD showMessag:@"正在加载中..." toView:self.view];
        
        [SMS_SDK getAppContactFriends:1 result:^(enum SMS_ResponseState state, NSArray *array) {
            if (1==state)
            {
                NSLog(@"block 获取好友列表成功");
                
                [_friendsController setMyData:array];
                [self presentViewController:_friendsController animated:YES completion:^{
                    ;
                }];
            }
            else if(0==state)
            {
                NSLog(@"block 获取好友列表失败");
            }
        }];

    
}
@end
