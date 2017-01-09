//
//  SHConstStr.m
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//


#import <UIKit/UIKit.h>

/** UITabBar的高度 */
CGFloat const SHTabBarH = 49;

/** 导航栏的最大Y值 */
CGFloat const SHNavMaxY = 64;

/** 标题栏的高度 */
CGFloat const SHTitlesViewH = 35;

/** 全局统一的间距 */
CGFloat const SHMarin = 10;

/** 统一的一个请求路径 */
NSString  * const SHCommonURL = @"http://api.budejie.com/api/api_open.php";

/** TabBarButton被重复点击的通知 */
NSString  * const SHTabBarButtonDidRepeatClickNotification = @"SHTabBarButtonDidRepeatClickNotification";

/** TitleButton被重复点击的通知 */
NSString  * const SHTitleButtonDidRepeatClickNotification = @"SHTitleButtonDidRepeatClickNotification";
