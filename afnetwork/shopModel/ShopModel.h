//
//  ShopModel.h
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "MTLModel.h"
#import "MTLDateModel.h"
#import "ShopDataModel.h"


@interface ShopModel : MTLDateModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *count;
@property (readonly, nonatomic, assign, getter = isisEnd) BOOL isEnd;
@property (nonatomic, copy, readonly) NSArray *data;

@end
