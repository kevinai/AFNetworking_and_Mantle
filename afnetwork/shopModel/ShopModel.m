//
//  ShopModel.m
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"count": @"count",
             @"isEnd": @"isEnd",
             @"data": @"data"
             };
}

+ (NSValueTransformer *)dataJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[ShopDataModel class]];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) {
        return nil;
    }
    
    return self;
}




@end
