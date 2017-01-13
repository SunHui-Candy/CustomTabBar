//
//  UIImage+SHOriginalImage.h
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
// 图片的分类 1.获取没有被渲染的原始图片

#import <UIKit/UIKit.h>

@interface UIImage (SHOriginalImage)

// 获取没有被渲染的原始图片
+ (instancetype) imageOriginalWithName:(NSString *)imageName;


- (instancetype)sh_circleImage;

+ (instancetype)sh_circleImageNamed:(NSString *)name;

@end


