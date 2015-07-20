//
//  LoadNetWork.h
//  Project2
//
//  Created by lanqs on 15/7/20.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface LoadNetWork : NSObject
/**
 *  post网络请求
 *
 *  @param url     请求url的NSString
 *  @param params  请求参数
 *  @param success 请求成功执行操作
 *  @param failure 请求失败执行操作
 */
+ (void)loadNetWorkWithURL:(NSString *)url params:(NSDictionary *)params
                   success:(void (^)(id responseObject))success
                   failure:(void (^)( NSError *error))failure;

@end
