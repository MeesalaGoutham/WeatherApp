//
//  MMNetworkingManager.m
//  MintMesh
//
//  Created by Enterpi on 05/05/15.
//  Copyright (c) 2015 Enterpi. All rights reserved.
//

#import "WANetworkingManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation WANetworkingManager: AFHTTPSessionManager

+ (WANetworkingManager *)sharedNetworkingManager
{
    static WANetworkingManager *networkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkManager = [[WANetworkingManager alloc] initWithBaseURL:[NSURL URLWithString:[WANetworkingManager baseUrl]]];
    });
    return networkManager;
}


+(NSString *)baseUrl{

    return FASBase_URL;
}

- (void)getdataWithID:(NSString *)requstid completionBlock:(WAParsingCompletionBlock)completionBlock{

    [self GET:requstid parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        completionBlock(responseObject,nil);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionBlock(nil, error);
        NSLog(@"%@",error);

    }];
    
}





@end
