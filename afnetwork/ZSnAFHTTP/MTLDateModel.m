//
//  MTLDateModel.m
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "MTLDateModel.h"

@implementation MTLDateModel


-(void)encodeWithCoder:(NSCoder *)coder{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    _MTLDateModelMadetime=a;
    
    _MTLDateModelinvalidtime=_MTLDateModelMadetime+_MTLDateModelinvalidaftertime;
    
    [super encodeWithCoder:coder];
}

@end
