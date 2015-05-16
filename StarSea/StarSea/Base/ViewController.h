//
//  ViewController.h
//  StarSea
//
//  Created by WayneLiu on 15/4/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JTCalendar.h"

@interface ViewController : UIViewController<JTCalendarDataSource,UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate>
//UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarContentViewHeight;
@property (weak, nonatomic) IBOutlet UILabel *currentMonthDayWeekday;


//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) JTCalendar *calendar;




@end

