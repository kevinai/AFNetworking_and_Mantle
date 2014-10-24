//
//  MTLDateModel.h
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "MTLModel.h"

@interface MTLDateModel : MTLModel

@property (nonatomic, assign, readonly) NSTimeInterval MTLDateModelMadetime;//创建时间
@property (nonatomic, assign) NSTimeInterval MTLDateModelinvalidaftertime;//多少时间后报销
@property (nonatomic, assign, readonly) NSTimeInterval MTLDateModelinvalidtime;//什么时间报销

@end
