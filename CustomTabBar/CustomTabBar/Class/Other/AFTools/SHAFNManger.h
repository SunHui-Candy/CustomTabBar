//
//  SHAFNManger.h
//  CustomTabBar
//
//  Created by ios on 17/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>


typedef void(^SUCCESS_BLOCK)(id data);
typedef void(^FAIL_BLOCK)(NSError * error);

@interface SHAFNManger : AFHTTPSessionManager

/**
 *  使用本方法生成唯一的 API 管理类单例
 *
 *  @return 单例
 */
+ (instancetype)sharedManager;

@end

#pragma mark - 登录注册相关

@interface SHAFNManger(TwoUser)

/**

 推荐标签
 */

- (void)actionGetSubTagSuccess:(SUCCESS_BLOCK)success
                           failure:(FAIL_BLOCK)failure;

@end
