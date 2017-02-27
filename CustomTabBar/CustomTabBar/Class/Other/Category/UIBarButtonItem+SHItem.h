//
//  UIBarButtonItem+SHItem.h
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SHItem)

// 快速创建UIBarButtonItem
+ (UIBarButtonItem *)itemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

// 导航的返回按钮
+ (UIBarButtonItem *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;

+ (UIBarButtonItem *)itemWithimage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;


@end
