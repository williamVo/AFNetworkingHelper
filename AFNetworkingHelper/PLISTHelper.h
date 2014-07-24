//
//  PLISTHelper.h
//  DallasAFNetworkingHelper
//
//  Created by ENCLAVEIT on 7/23/14.
//  Copyright (c) 2014 ENCLAVEIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLISTHelper : NSObject
+ (void)requestAFHTTPRequestOperation:(NSURL *)uploadFileApi
                              success:(id)successBlock
                                 fail:(id)failBlock;
+ (void)cancelAllHTTPOperations:(NSString *)method path:(NSString *)path;
+ (void)multiPartHTTPRequest:(NSString *)fileURL  filePath:(NSURL *)filePath
                 parameters:(NSDictionary*)parameters
                    success:(id)successBlock
                       fail:(id)failBlock;
+(void)postgetAFHTTPOperation:(NSString *)fileURL parameters:(NSDictionary*)parameters
                         type:(NSString *)type
                      success:(id)successBlock
                         fail:(id)failBlock;

@end
