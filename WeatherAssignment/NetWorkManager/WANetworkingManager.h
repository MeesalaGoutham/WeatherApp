//
//  MMNetworkingManager.h
//  MintMesh
//
//  Created by Enterpi on 05/05/15.
//  Copyright (c) 2015 Enterpi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#define REQUEST_SUCCESS 200
#define FASBase_URL @"http://api.wunderground.com/api/a182d242313f9380/conditions/q/"

typedef void (^WAParsingCompletionBlock)(id response, NSError *error);

@interface WANetworkingManager : AFHTTPSessionManager


+(instancetype)sharedNetworkingManager;
+(NSString *)baseUrl;
- (void)getdataWithID:(NSString *)requstid completionBlock:(WAParsingCompletionBlock)completionBlock;


@end
