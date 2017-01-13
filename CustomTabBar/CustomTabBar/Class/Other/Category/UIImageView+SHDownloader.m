//
//  UIImageView+SHDownloader.m
//  CustomTabBar
//
//  Created by ios on 17/1/11.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "UIImageView+SHDownloader.h"

@implementation UIImageView (SHDownloader)

- (void)sh_setHeader:(NSString *)headeUrl
{
    UIImage *placeholder = [UIImage sh_circleImageNamed:@"defaultUserIcon"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:headeUrl] placeholderImage:placeholder options:0 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (!image) {
            return ;
        }
        
        self.image = [image sh_circleImage];
    }];
}
@end
