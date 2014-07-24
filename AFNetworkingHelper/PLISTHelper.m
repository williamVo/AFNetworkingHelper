//
//  PLISTHelper.m
//  DallasAFNetworkingHelper
//
//  Created by ENCLAVEIT on 7/23/14.
//  Copyright (c) 2014 ENCLAVEIT. All rights reserved.
//

#import "PLISTHelper.h"

@implementation PLISTHelper


#pragma mark - HTTP Request Operation Manager
/** request JSON AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author:
 */
+ (void)requestPListAFHTTPRequestOperation:(NSURL *)fileURL
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

/** request JSON AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author:
 */
+ (void)requestJSONAFHTTPRequestOperation:(NSURL *)fileURL
                                   success:(id)successBlock
                                      fail:(id)failBlock
{
    NSURLRequest *req = [NSURLRequest requestWithURL:fileURL
                                         cachePolicy:NSURLCacheStorageNotAllowed
                                     timeoutInterval:60.0];
    
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [op setCompletionBlockWithSuccess: successBlock failure: failBlock];
    
    [op start];
}
/** request XML AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author:
 */
+ (void)requestXMLAFHTTPRequestOperation:(NSURL *)fileURL
                                   success:(id)successBlock
                                      fail:(id)failBlock
{
    NSURLRequest *req = [NSURLRequest requestWithURL:fileURL
                                         cachePolicy:NSURLCacheStorageNotAllowed
                                     timeoutInterval:60.0];
    
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFXMLParserResponseSerializer serializer];
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
 @author:
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
  @author:
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

#pragma mark - AFURLSessionManager
/** CREATING A DOWNLOAD TASK
 @param completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {}
 @param destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {}
 @param progress:(NSProgress *__autoreleasing *)
 @author:
 */
+(void)createAFHTTPDownloadTask:(NSURL*)downloadURL isResume:(BOOL)isResume withData:(NSData *)data destination:(id)destination success:(id)successBlock
{
    if (isResume) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL
                                                 cachePolicy:NSURLCacheStorageNotAllowed
                                             timeoutInterval:60.0];
        
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:destination completionHandler:successBlock];
        [downloadTask resume];

    } else {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithResumeData:data progress:nil destination:destination completionHandler:successBlock];
   
        [downloadTask resume];
     
    }
}

/** CREATING AN UPLOAD TASK
@param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
@param progress :(NSProgress *__autoreleasing *)
@author:
 */
+ (void)createAFHTTPUploadTask:(NSURL*)uploadURL filePath:(NSURL*)filePath destination:(id)destination success:(id)successBlock
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:uploadURL
                                             cachePolicy:NSURLCacheStorageNotAllowed
                                                timeoutInterval:60.0];

    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:successBlock];
    [uploadTask resume];
}

/** CREATING AN UPLOAD TASK FOR A MULTI-PART REQUEST, WITH PROGRESS
 @param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
 @param progress :(NSProgress *__autoreleasing *)
 @author:
 */
+ (void)createMultiAFHTTPUploadTask:(NSString*)uploadURL filePath:(NSString*)filePath constructingBodyWithBlock:(id)constructingBody success:(id)successBlock
{
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:uploadURL parameters:nil constructingBodyWithBlock:constructingBody error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSProgress *progress = nil;
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:successBlock];
    
    [uploadTask resume];
}

/** CREATING A DATA TASK
 @param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
 @param progress :(NSProgress *__autoreleasing *)
 @author:
 */
+ (void)createDataAFHTTPTask:(NSURL*)uploadURL filePath:(NSString*)filePath success:(id)successBlock
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:uploadURL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:successBlock];
    [dataTask resume];
}

@end
