//
//  LoadNetWork.m
//  Project2
//
//  Created by lanqs on 15/7/20.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "LoadNetWork.h"
@implementation LoadNetWork

+ (void)loadNetWorkWithURL:(NSString *)url params:(NSDictionary *)params
                   success:(void (^)(id responseObject))success
                   failure:(void (^)( NSError *error))failure
{
    AFHTTPRequestOperationManager *mananer = [AFHTTPRequestOperationManager manager];
    mananer.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [mananer POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
