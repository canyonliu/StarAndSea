//
//  FriendsViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/1.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "FriendsViewController.h"
#import "DetailFriendViewController.h"
#import "FriendsCell.h"
#import "Tools.h"

#import "UPStackMenu.h"
#import "UPStackMenuItem.h"

@interface FriendsViewController ()<UITableViewDataSource,UITableViewDelegate,UPStackMenuDelegate>
{
    UIView *contentView;
     UPStackMenu *stack;
}
@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.frierndsList.backgroundColor = [UIColor greenColor];
    [self setupStackMenu];
    
}

//初始化弹出菜单,并且添加事件
-(void)setupStackMenu
{
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [contentView setBackgroundColor:[UIColor colorWithRed:112./255. green:47./255. blue:168./255. alpha:1.]];
    [contentView.layer setCornerRadius:6.];
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cross"]];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setFrame:CGRectInset(contentView.frame, 10, 10)];
    [contentView addSubview:icon];
    
    stack = [[UPStackMenu alloc]initWithContentView:contentView];
    [stack setCenter:CGPointMake(self.view.frame.size.width-70, self.view.frame.size.height - 80)];
    [stack setDelegate:self];
    
    UPStackMenuItem *squareItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"test3"] highlightedImage:nil title:@"添加联系人"];
    UPStackMenuItem *circleItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"test2"] highlightedImage:nil title:@"发消息"];
    UPStackMenuItem *triangleItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"test1"] highlightedImage:nil title:@"Triangle"];
    UPStackMenuItem *crossItem = [[UPStackMenuItem alloc] initWithImage:[UIImage imageNamed:@"cross"] highlightedImage:nil title:@"Cross"];
    NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:squareItem, circleItem, triangleItem, crossItem, nil];
    [items enumerateObjectsUsingBlock:^(UPStackMenuItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitleColor:[UIColor greenColor]];
    }];
    
    
    [stack setAnimationType:UPStackMenuAnimationType_progressiveInverse];
    [stack setStackPosition:UPStackMenuStackPosition_up];
    [stack setOpenAnimationDuration:.4];
    [stack setCloseAnimationDuration:.4];
    [items enumerateObjectsUsingBlock:^(UPStackMenuItem *item, NSUInteger idx, BOOL *stop) {
        if(idx%2 == 0)
            [item setLabelPosition:UPStackMenuItemLabelPosition_left];
        else
            [item setLabelPosition:UPStackMenuItemLabelPosition_right];
    }];
    [stack addItems:items];
    [self.view addSubview:stack];

    
}


#pragma mark tableView的代理和数据源
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *ID = @"friendsCell";
    FriendsCell *cell;
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"FriendsCell" owner:nil options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.headPicImageView.image = [UIImage imageNamed:@"test_Pic"];
    cell.nameLabel.text = @"张雨生";
    cell.phoneNumLabel.text=@"1020156321";
//    cell.sendMessageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [cell.sendMessageBtn setImage:[UIImage imageNamed:@"test_pic"] forState:UIControlStateNormal];

    [Tools ChoosenImageViewChangeModelToCircle:cell.headPicImageView];

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailFriendViewController *friendDetailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"detailFriendsVC"];
    [self.navigationController pushViewController:friendDetailVC animated:YES];
    
}




#pragma mark - UPStackMenuDelegate的代理


- (void)setStackIconClosed:(BOOL)closed
{
    UIImageView *icon = [[contentView subviews] objectAtIndex:0];
    float angle = closed ? 0 : (M_PI * (135) / 180.0);
    [UIView animateWithDuration:0.3 animations:^{
        [icon.layer setAffineTransform:CGAffineTransformRotate(CGAffineTransformIdentity, angle)];
    }];
}


- (void)stackMenuWillOpen:(UPStackMenu *)menu
{
    if([[contentView subviews] count] == 0)
        return;
    
    [self setStackIconClosed:NO];
}

- (void)stackMenuWillClose:(UPStackMenu *)menu
{
    if([[contentView subviews] count] == 0)
        return;
    
    [self setStackIconClosed:YES];
}

//点击的按钮响应
- (void)stackMenu:(UPStackMenu *)menu didTouchItem:(UPStackMenuItem *)item atIndex:(NSUInteger)index
{
    NSString *message = [NSString stringWithFormat:@"Item touched : %@", item.title];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
