//
//  ShopDataModel.h
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "MTLModel.h"
#import "MTLDateModel.h"

@interface ShopDataModel : MTLDateModel<MTLJSONSerializing>

@property (readonly, nonatomic, copy) NSString *infoid;
@property (readonly, nonatomic, copy) NSString *title;
@property (readonly, nonatomic, copy) NSString *subtitle;
@property (readonly, nonatomic, copy) NSString *file1;
@property (readonly, nonatomic, copy) NSString *lat;
@property (readonly, nonatomic, copy) NSString *lng;
@property (readonly, nonatomic, copy) NSString *distance;
@property (readonly, nonatomic, copy) NSString *relaycontent;
@property (readonly, nonatomic, copy) NSString *foodcount;

@end
