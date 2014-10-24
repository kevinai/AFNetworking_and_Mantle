//
//  ZSNAFHTTPRequestOperation.h
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "AFHTTPRequestOperation.h"
#import "MTLDateModel.h"

@interface ZSNAFHTTPRequestOperation : AFHTTPRequestOperationManager

@property (nonatomic,strong,readonly) MTLDateModel *model;
 
//用于本地缓存的get请求数据方式
- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject,id responseMTLModel))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
                       Location:(BOOL)isLocation
                          class:(Class)class
                            time:(NSTimeInterval)time;
//isLocation是否缓存 class是什么mtmodel类的
@end
