//
//  StarSeaServerHttpRequest.h
//  StarSea
//
//  Created by WayneLiu on 15/5/7.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StarSeaServerParser.h"
#import "Tools.h"
#import "ASIFormDataRequest.h"


@interface StarSeaServerHttpRequest : NSObject
{
    StarSeaServerParser *parser;
}



-(void)startStarSeaServerHttpRequest_WithDict:(NSDictionary *)dict ActionURL:(StarSea_ServerIndex )actionIndex;

@end
