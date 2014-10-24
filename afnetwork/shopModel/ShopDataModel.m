//
//  ShopDataModel.m
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "ShopDataModel.h"

@implementation ShopDataModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"infoid": @"infoid",
             @"title": @"title",
             @"subtitle": @"subtitle",
             @"file1": @"file1",
             @"lat": @"lat",
             @"lng": @"lng",
             @"distance": @"distance",
             @"relaycontent": @"relaycontent",
             @"foodcount": @"foodcount",
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    return self;
}

@end
