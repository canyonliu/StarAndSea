//
//  Tools.h
//  StarSea
//
//  Created by WayneLiu on 15/5/3.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface Tools : NSObject
//获得当前日期
+(NSString *)getCurrentDate;
//获得点击的日期
+(NSDate *)getClickedDate:(NSDate *)date;
//图片变成圆形
+(void)ChoosenImageViewChangeModelToCircle :(UIImageView *)ChoosedImageView;

//应用程序主颜色
+(UIColor *)getMainColor;
//应用程序字体主颜色
+ (UIColor *)getTintColor;
//应用程序背景颜色
+ (UIColor *)getBackgroundColor;


//应用程序主字体
+(UIFont *)getMainFont:(CGFloat)size;
//字典序列化
+(NSString *)jsonSerialization:(NSDictionary *)dict;
//检查当前网络类型
+(NSString *)checkCurrNetworkType;


//检查网络状态是否存在
+(BOOL)checkNetWorking;


+(void)showHUD:(NSString *)textLabel andView:(UIView *)view andHUD:(MBProgressHUD *)hud;

@end
