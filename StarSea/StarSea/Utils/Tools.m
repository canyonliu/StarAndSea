//
//  Tools.m
//  StarSea
//
//  Created by WayneLiu on 15/5/3.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "Tools.h"

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

@end
