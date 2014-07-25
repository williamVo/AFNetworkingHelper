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
/** request PList AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :^(AFHTTPRequestOperation *operation, id responseObject) {}
        A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :^(AFHTTPRequestOperation *operation, NSError *error) {} 
        A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
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
 @param successBlock :^(AFHTTPRequestOperation *operation, id responseObject) {} 
        A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :^(AFHTTPRequestOperation *operation, NSError *error) {} 
        A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
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
 @param successBlock :^(AFHTTPRequestOperation *operation, id responseObject) {}
        A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :^(AFHTTPRequestOperation *operation, NSError *error) {} :
        A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
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

/** cancel All HTTP Operations
 @param method :
 @param path:
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author:
 */
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
                         isPOST:(BOOL *)isPOST
                             success:(id)successBlock
                                fail:(id)failBlock
{
   
    if (isPOST)
    {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:fileURL parameters:parameters success:successBlock failure:failBlock];

    }
    else
    {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:fileURL parameters:nil success:successBlock failure:failBlock ];
    }
    
}

#pragma mark - AFURLSessionManager
/** CREATING A DOWNLOAD TASK
 @param completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {}
 @param destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {} 
        destination A block object to be executed in order to determine the destination of the downloaded file. This block takes two arguments, the target path & the server response, and returns the desired file URL of the resulting download. The temporary file used during the download will be automatically deleted after being moved to the returned URL.
 @param progress:(NSProgress *__autoreleasing *) 
        progress A progress object monitoring the current download progress.
 @param successBlock:
    completionHandler A block to be executed when a task finishes. This block has no return value and takes three arguments: the server response, the path of the downloaded file, and the error describing the network or parsing error that occurred, if any.

 @param isResume: if isResume == Yes call run download task, else run create download task with resume data
 @warning If using a background `NSURLSessionConfiguration` on iOS, these blocks will be lost when the app is terminated. Background sessions may prefer to use `-setDownloadTaskDidFinishDownloadingBlock:` to specify the URL for saving the downloaded file, rather than the destination block of this method.
 @author:
 */

+(void)createAFHTTPDownloadTask:(NSURL*)downloadURL isResume:(BOOL)isResume withData:(NSData *)data destination:(id)destination success:(id)successBlock
{
    //create download task
    if (isResume) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL
                                                 cachePolicy:NSURLCacheStorageNotAllowed
                                             timeoutInterval:60.0];
        
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:destination completionHandler:successBlock];
        [downloadTask resume];

    //create download task with resume data
    } else {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithResumeData:data progress:nil destination:destination completionHandler:successBlock];
   
        [downloadTask resume];
     
    }
}

/** CREATING AN UPLOAD TASK with the specified request for a local file
 
@param uploadURL A URL to the local file to be uploaded.
@param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
        A block object to be executed when the task finishes. This block has no return value and takes three arguments: the server response, the response object created by that serializer, and the error that occurred, if any.
@param progress :(NSProgress *__autoreleasing *)
        progress A progress object monitoring the current upload progress.
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
        A block object to be executed when the task finishes. This block has no return value and takes three arguments: the server response, the response object created by that serializer, and the error that occurred, if any.
 @param progress :(NSProgress *__autoreleasing *) 
        A progress object monitoring the current upload progress.

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
        completionHandler A block object to be executed when the task finishes. This block has no return value and takes three arguments: the server response, the response object created by that serializer, and the error that occurred, if any.
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
#pragma mark - Request Serialization
/*
 Request serializers create requests from URL strings, encoding parameters as either a query string or HTTP body. 
 */
+ (NSMutableURLRequest*)parametersEncodingwithMethod:(NSString*)method urlString:(NSString*)urlString contentType:(NSString*)contentType parameters:(NSDictionary*)parameters
{
    NSMutableURLRequest *result= [[AFHTTPRequestSerializer serializer] requestWithMethod:method URLString:urlString parameters:parameters error:nil];

    return result;
}

#pragma mark - Network Reachability Manager
/*
 AFNetworkReachabilityManager monitors the reachability of domains, and addresses for both WWAN and WiFi network interfaces.
*/
/** SHARED NETWORK REACHABILITY
 
 */
+(void)getShareNetworkStatus{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
}

+(void)getHTTPNetworkStatus:(NSURL*)URL
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:URL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
}
@end
