//
//  SHAFNManger.m
//  CustomTabBar
//
//  Created by ios on 17/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHAFNManger.h"

@implementation SHAFNManger


/**
 *  使用本方法生成唯一的 API 管理类单例
 *
 *  @return 单例
 */
+ (instancetype)sharedManager
{
    static SHAFNManger *_instance;
    _instance = [self manager];
    _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    _instance.requestSerializer.timeoutInterval = 30;
    return _instance;
}



@end

@implementation SHAFNManger(Private)


- (void)customGetWithParameters:(NSDictionary *)parameters
                        cmdName:(NSString *)cmdName
                        success:(SUCCESS_BLOCK)success
                        failure:(FAIL_BLOCK)failure
{
    
    NSString *url = kFormat(@"%@%@", SHCommonURL,cmdName);
    
    [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success){
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}




@end

@implementation SHAFNManger(TwoUser)

- (void)actionGetSubTagSuccess:(SUCCESS_BLOCK)success failure:(FAIL_BLOCK)failure
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";

    [self customGetWithParameters:parameters cmdName:@"" success:success failure:failure];
}




@end








