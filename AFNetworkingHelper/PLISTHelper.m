//
//  PLISTHelper.m
//  DallasAFNetworkingHelper
//
//  Created by ENCLAVEIT on 7/23/14.
//  Copyright (c) 2014 ENCLAVEIT. All rights reserved.
//

#import "PLISTHelper.h"

@implementation PLISTHelper

/**
(NSURL *)uploadFileApi :The request object to be loaded asynchronously during execution of the operation.
(id)successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
(id)failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 */
+ (void)requestAFHTTPRequestOperation:(NSURL *)uploadFileApi
                              success:(id)successBlock
                                 fail:(id)failBlock

{
    NSURLRequest *req = [NSURLRequest requestWithURL:uploadFileApi
                                         cachePolicy:NSURLCacheStorageNotAllowed
                                     timeoutInterval:60.0];
    
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFPropertyListResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [op setCompletionBlockWithSuccess: successBlock failure: failBlock];
    
    [op start];
}
@end
