//
//  ZSNAFHTTPRequestOperation.m
//  afnetwork
//
//  Created by 郑苏宁 on 14/10/24.
//  Copyright (c) 2014年 郑苏宁. All rights reserved.
//

#import "ZSNAFHTTPRequestOperation.h"
#import "MTLDateModel.h"

@implementation ZSNAFHTTPRequestOperation

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject,id responseMTLModel))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
                       Location:(BOOL)isLocation
                          class:(Class)class
                           time:(NSTimeInterval)time
{
    
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [Path stringByAppendingPathComponent:[URLString stringByReplacingOccurrencesOfString:@"/" withString:@"、"]];
    
    
    
    
    if (isLocation) {
        
         _model=[NSKeyedUnarchiver unarchiveObjectWithFile: filename];
        if (_model!=nil) {
            
            NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
            NSTimeInterval a=[dat timeIntervalSince1970];
            
            
            
            if (_model.MTLDateModelinvalidtime>a) {
                if (success) {
                    success(nil ,nil,_model);
                }
            }
            else{
                //            请求+保存
                NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
                AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *error = nil;
                    _model = [MTLJSONAdapter modelOfClass:class fromJSONDictionary:responseObject error:&error];
                    
                    _model.MTLDateModelinvalidaftertime=time;
                    [NSKeyedArchiver archiveRootObject:_model toFile:filename];
                    
                    if (success) {
                        success(operation,responseObject,_model);
                    }
                    
                } failure:failure];
                
                [self.operationQueue addOperation:operation];
                
                return operation;
            }
            
            
            
        }
        else{
//            请求+保存
            NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
            AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSError *error = nil;
                _model = [MTLJSONAdapter modelOfClass:class fromJSONDictionary:responseObject error:&error];
                
                _model.MTLDateModelinvalidaftertime=time;
                [NSKeyedArchiver archiveRootObject:_model toFile:filename];
                
                if (success) {
                    success(operation,responseObject,_model);
                }
                
            } failure:failure];
            
            [self.operationQueue addOperation:operation];
            
            return operation;
        }
        
    }
    else{
//        请求
        NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
        AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
            if (success) {
                success(operation,responseObject,nil);
            }
            
        } failure:failure];
        
        [self.operationQueue addOperation:operation];
        
        return operation;
    }
    
    
   
    
    return nil;
}

@end
