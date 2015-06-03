//
//  Tools.m
//  StarSea
//
//  Created by WayneLiu on 15/5/3.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "Tools.h"
#import "Reachability.h"

@implementation Tools



+(NSString *)getCurrentDate
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDate *now = [NSDate date];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:now];
    
    int week = (unsigned)[comps weekday]-1;
    int month  = (unsigned)[comps month];
    int day = (unsigned)[comps day];
    
    if (week == 0) {
        week = 7;
    }
    //NSDate *week = [comps weekday];
    //    month = [comps month];
    //    day = [comps day];
    NSString *currentMonthDay  = [NSString stringWithFormat:@"%d月%d日 星期%d",month,day,week];
    
    
    NSLog(@"当前时间:%d月%d日 星期%d",month,day,week);
    return currentMonthDay;
}

+(NSDate *)getClickedDate: (NSDate *)date
{
    NSTimeZone *localZone=[NSTimeZone localTimeZone];
    NSInteger interval=[localZone secondsFromGMTForDate:date];
    NSDate *mydate=[date dateByAddingTimeInterval:interval];
    NSLog(@"点击选择的日期: %@", mydate);
    return  mydate;
}

+(void)ChoosenImageViewChangeModelToCircle:(UIImageView *)ChoosedImageView
{
    UIBezierPath* path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(ChoosedImageView.bounds.size.width/2, ChoosedImageView.bounds.size.height/2) radius:ChoosedImageView.bounds.size.width/2-5 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer* shape1 = [CAShapeLayer layer];
    
    shape1.path = path1.CGPath;
    
    ChoosedImageView.layer.mask = shape1;
}


+(NSString *)jsonSerialization:(NSDictionary *)dict
{
    NSError *error = nil;
    
    //NSJSONWritingPrettyPrinted:指定生成的JSON数据应使用空格旨在使输出更加可读。如果这个选项是没有设置,最紧凑的可能生成JSON表示。
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    if([jsonData length] > 0&&error == nil)
    {
        NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        return  jsonString;
    }
    
    return  nil;
    
}




+(NSString *)checkCurrNetworkType
{
    //BOOL isExistenceNetwork = YES;//是否存在网络
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.apple.com"];
    switch ([reachability currentReachabilityStatus]) {
        case NotReachable:
            //isExistenceNetwork = NO;
            //LQCLog(@"无法连接网络");
            return @"无法连接网络";
            break;
        case ReachableViaWiFi:
            //isExistenceNetwork = YES;
            //LQCLog(@"WIFI连接网络");
            return @"WIFI";
            break;
        case ReachableViaWWAN:
            //isExistenceNetwork = NO;
            //LQCLog(@"流量连接网络");
            return @"3G";
            break;
    }
    return  nil;
}

+ (BOOL)checkNetWorking
{
    BOOL isExistenceNetwork = YES;//是否存在网络
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.apple.com"];
    switch ([reachability currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            LQCLog(@"无法连接网络");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            LQCLog(@"WIFI连接网络");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = NO;
            LQCLog(@"流量连接网络");
            break;
    }
    return  isExistenceNetwork;
    
}



+(UIFont *)getMainFont:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+(UIColor *)getMainColor
{
    return [UIColor colorWithRed:65/255.f green:165/255.f blue:85/255.f alpha:1];
}

+(UIColor *)getTintColor
{
    return [UIColor whiteColor];
}

+(UIColor *)getBackgroundColor
{
    return [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1];
}



+(void)showHUD:(NSString *)textLabel andView:(UIView *)view andHUD:(MBProgressHUD *)hud
{
    [view addSubview:hud];
    hud.labelText = textLabel;
    
    hud.square = YES;
    [hud show:YES];
}

@end
