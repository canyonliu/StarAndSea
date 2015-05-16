//
//  NotesTableViewCell.h
//  StarSea
//
//  Created by WayneLiu on 15/5/14.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *informTime;
@property (weak, nonatomic) IBOutlet UIImageView *invitePersonPic;
@property (weak, nonatomic) IBOutlet UILabel *informDetailContent;
@property (weak, nonatomic) IBOutlet UILabel *inviteAddress;
@end
