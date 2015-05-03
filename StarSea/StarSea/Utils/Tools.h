//
//  Tools.h
//  StarSea
//
//  Created by WayneLiu on 15/5/3.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject
//获得当前日期
+(NSString *)getCurrentDate;
//获得点击的日期
+(NSDate *)getClickedDate:(NSDate *)date;
//图片变成圆形
+(void)ChoosenImageViewChangeModelToCircle :(UIImageView *)ChoosedImageView;

@end
