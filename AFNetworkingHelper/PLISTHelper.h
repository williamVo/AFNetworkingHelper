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
@end
