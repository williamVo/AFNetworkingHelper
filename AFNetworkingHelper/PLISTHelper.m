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
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 */
+ (void)requestAFHTTPRequestOperation:(NSURL *)fileURL
                              success:(id)successBlock
                                 fail:(id)failBlock
{
    NSURLRequest *req = [NSURLRequest requestWithURL:fileURL
                                         cachePolicy:NSURLCacheStorageNotAllowed
                                     timeoutInterval:60.0];
    
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFPropertyListResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [op setCompletionBlockWithSuccess: successBlock failure: failBlock];
    
    [op start];
}

+ (void)cancelAllHTTPOperations:(NSString *)method path:(NSString *)path{
    
}

/** POST MULTI-PART REQUEST
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 */
+(void)multiPartHTTPRequest:(NSString *)fileURL  filePath:(NSURL *)filePath
                 parameters:(NSDictionary*)parameters
                    success:(id)successBlock
                       fail:(id)failBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    id constructingBody = ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePath name:@"image" error:nil];
    };

    [manager POST:fileURL parameters:parameters constructingBodyWithBlock:constructingBody success:successBlock failure:failBlock];
}

/** POST-GET REQUEST
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param type : if type == "POST": POST URL-FORM-ENCODED REQUEST
        type : if type == "GET ": GET REQUEST
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 */

+(void)postgetAFHTTPOperation:(NSString *)fileURL parameters:(NSDictionary*)parameters
                         type:(NSString *)type
                             success:(id)successBlock
                                fail:(id)failBlock
{
   
    if ([type isEqualToString:@"POST"])
    {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:fileURL parameters:parameters success:successBlock failure:failBlock];

    }
    else if ([type isEqualToString:@"GET"])
    {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:fileURL parameters:nil success:successBlock failure:failBlock ];
    }
    
}


@end
