//
//  CommonDeifine.h
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//



/***********屏幕适配*************/
#define SHScreenW [UIScreen mainScreen].bounds.size.width
#define SHScreenH [UIScreen mainScreen].bounds.size.height
#define iphone6P (SHScreenH == 736)
#define iphone6 (SHScreenH == 667)
#define iphone5 (SHScreenH == 568)
#define iphone4 (SHScreenH == 480)
/***********屏幕适配*************/


// 调试输出

#define SHFunc SHLog(@"%s",__func__)

#ifdef DEBUG // 调试

#define SHLog(...) NSLog(__VA_ARGS__);

#else

#define SHLog(...)

#endif

// 图片
#define kImageName(imageName) [UIImage imageNamed:imageName]

// 字体大小
#define kFontBodySie(size) [UIFont boldSystemFontOfSize:size];
#define kFontSize(size) [UIFont systemFontOfSize:size];

// 格式化字符串
#define kFormat(string, args...)       [NSString stringWithFormat:string, args]



// 颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kTitleColor  RGBA(51, 51, 51, 1)

#define kOrangeMainColor  RGBA(253,103,33,1)

#define kBlueColor  RGBA(69,156,254,1)

#define kSubTitleColor  RGBA(161,175,180,1)

#define kBlackColor  RGBA(80,84,82,1)

#define kWhiterColor RGBA(255,255,255,1)

#define kCellLightGrayColor RGBA(235, 235, 235, 100)

#define kBackGroundColor RGBA(247, 249, 251, 100)


#define SHColor(r,g,b) [UIColor colorWithRed:(r) / 256.0 green:(g) / 256.0 blue:(b) / 256.0 alpha:1]

#define SHRandomColor SHColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))




