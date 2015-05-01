//
//  FriendsViewController.m
//  StarSea
//
//  Created by WayneLiu on 15/5/1.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendsCell.h"

@interface FriendsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

    
    //cell.sendMessageBtn.imageView.image = [UIImage imageNamed:@"test_Pic"];
    
    UIBezierPath* path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(cell.headPicImageView.bounds.size.width/2, cell.headPicImageView.bounds.size.height/2) radius:cell.headPicImageView.bounds.size.width/2-5 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer* shape1 = [CAShapeLayer layer];
    
    shape1.path = path1.CGPath;
    
    cell.headPicImageView.layer.mask = shape1;

    
    return cell;
    
}


@end
