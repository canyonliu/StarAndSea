//
//  StarSeaServerParser.h
//  StarSea
//
//  Created by WayneLiu on 15/5/7.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarSeaServerParser : NSObject
{
    NSArray *_array;
}

-(void)sasRegister:(NSData *)jsonData;


@end
