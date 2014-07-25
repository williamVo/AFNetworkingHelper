//
//  PLISTHelper.h
//  DallasAFNetworkingHelper
//
//  Created by ENCLAVEIT on 7/23/14.
//  Copyright (c) 2014 ENCLAVEIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetworkingHelper : NSObject
/** request PList AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :^(AFHTTPRequestOperation *operation, id responseObject) {}
 A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :^(AFHTTPRequestOperation *operation, NSError *error) {}
 A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author: Tony
 */
+ (void)requestPListAFHTTPRequestOperation:(NSURL *)uploadFileApi
                              success:(id)successBlock
                                 fail:(id)failBlock;

/** request JSON AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :^(AFHTTPRequestOperation *operation, id responseObject) {}
 A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :^(AFHTTPRequestOperation *operation, NSError *error) {}
 A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author: William
 */
+ (void)requestJSONAFHTTPRequestOperation:(NSURL *)fileURL
                                  success:(id)successBlock
                                     fail:(id)failBlock;

/** request XML AFHTTP Request Operation
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :^(AFHTTPRequestOperation *operation, id responseObject) {}
 A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :^(AFHTTPRequestOperation *operation, NSError *error) {} :
 A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author: Violet
 */
+ (void)requestXMLAFHTTPRequestOperation:(NSURL *)fileURL
                                 success:(id)successBlock
                                    fail:(id)failBlock;

/** cancel All HTTP Operations
 @param method :
 @param path:
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author: William
 */
+ (void)cancelAllHTTPOperations:(NSString *)method path:(NSString *)path;


/** POST MULTI-PART REQUEST
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author: Tony
 */
+ (void)multiPartHTTPRequest:(NSString *)fileURL  filePath:(NSURL *)filePath
                 parameters:(NSDictionary*)parameters
                    success:(id)successBlock
                       fail:(id)failBlock;

/** POST-GET REQUEST
 @param fileURL :The request object to be loaded asynchronously during execution of the operation.
 @param type : if type == "POST": POST URL-FORM-ENCODED REQUEST
 type : if type == "GET ": GET REQUEST
 @param successBlock :A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failBlock :A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments:, the created request operation and the NSError object describing the network or parsing error that occurred.
 @author: Violet
 */
+(void)postgetAFHTTPOperation:(NSString *)fileURL parameters:(NSDictionary*)parameters
                       isPOST:(BOOL *)isPOST
                      success:(id)successBlock
                         fail:(id)failBlock;


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
 @author: Tony
 */
+ (void)createAFHTTPDownloadTask:(NSURL*)downloadURL isResume:(BOOL)isResume withData:(NSData *)data destination:(id)destination success:(id)successBlock;


/** CREATING AN UPLOAD TASK with the specified request for a local file
 
 @param uploadURL A URL to the local file to be uploaded.
 @param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
 A block object to be executed when the task finishes. This block has no return value and takes three arguments: the server response, the response object created by that serializer, and the error that occurred, if any.
 @param progress :(NSProgress *__autoreleasing *)
 progress A progress object monitoring the current upload progress.
 @author: Violet
 */

/** CREATING AN UPLOAD TASK FOR A MULTI-PART REQUEST, WITH PROGRESS
 @param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
 A block object to be executed when the task finishes. This block has no return value and takes three arguments: the server response, the response object created by that serializer, and the error that occurred, if any.
 @param progress :(NSProgress *__autoreleasing *)
 A progress object monitoring the current upload progress.
 
 @author: William
 */
+ (void)createAFHTTPUploadTask:(NSURL*)uploadURL filePath:(NSURL*)filePath destination:(id)destination success:(id)successBlock;


/** CREATING A DATA TASK
 @param successBlock : ^(NSURLResponse *response, id responseObject, NSError *error) {}
 completionHandler A block object to be executed when the task finishes. This block has no return value and takes three arguments: the server response, the response object created by that serializer, and the error that occurred, if any.
 @param progress :(NSProgress *__autoreleasing *)
 @author: Tony
 */
+ (void)createDataAFHTTPTask:(NSURL*)uploadURL filePath:(NSString*)filePath success:(id)successBlock;

/** 
  @author: Tony
 */
+ (NSMutableURLRequest*)parametersEncodingwithMethod:(NSString*)method urlString:(NSString*)urlString contentType:(NSString*)contentType parameters:(NSDictionary*)parameters;

/** get SHARED NETWORK REACHABILITY
  @author: William
 */
+(void)getShareNetworkStatus;

/** get HTTP Network REACHABILITY
  @author: Violet
 */
+(void)getHTTPNetworkStatus:(NSURL*)URL;


/** GET WITH AFHTTPREQUESTOPERATION
  @author: William
 */
+(void)getAFHTTPRequestOperation:(NSURL*)url success:(id)successBlock fail:(id)failBlock;

/** BATCH OF OPERATIONS
  @author: Tony
 */
+(void)callBatchOfRequestOperations:(NSString*)url method:(NSString*)method batch:(id)batch filesToUpload:(NSArray *)filesToUpload success:(id)successBlock fail:(id)failBlock;


@end
