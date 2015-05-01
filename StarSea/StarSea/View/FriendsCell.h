//
//  FriendsCell.h
//  StarSea
//
//  Created by WayneLiu on 15/5/1.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headPicImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendMessageBtn;

@end
