//
//  UIImage+SHOriginalImage.m
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "UIImage+SHOriginalImage.h"

@implementation UIImage (SHOriginalImage)

+ (instancetype)imageOriginalWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
