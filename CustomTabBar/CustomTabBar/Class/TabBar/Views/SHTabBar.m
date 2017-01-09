//
//  SHTabBar.m
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHTabBar.h"
#import "UIView+SHFrame.h"

@interface SHTabBar ()

/** 加号按钮 */
@property (nonatomic, weak) UIButton *plusBtn;

/** 记录上一次点击的按钮 */
@property (nonatomic, weak) UIControl *previousClickedTabBarButton;

@end

@implementation SHTabBar

#pragma mark - Private&Publick Methods

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.items.count;
    CGFloat btnW = self.sh_width / (count + 1);
    CGFloat btnH = self.sh_height;
    CGFloat x = 0;
    /*
     SHLog(@"%@",self.subviews);

     (
     "<_UIBarBackground: 0x15bd1d640; frame = (0 0; 414 49); userInteractionEnabled = NO; layer = <CALayer: 0x170222b60>>",
     "<UITabBarButton: 0x15bd1f560; frame = (2 1; 100 48); opaque = NO; layer = <CALayer: 0x170223f40>>",
     "<UITabBarButton: 0x15be10230; frame = (106 1; 99 48); opaque = NO; layer = <CALayer: 0x17403adc0>>",
     "<UITabBarButton: 0x15be11d20; frame = (209 1; 100 48); opaque = NO; layer = <CALayer: 0x17403ab00>>",
     "<UITabBarButton: 0x15bd38b40; frame = (313 1; 99 48); opaque = NO; layer = <CALayer: 0x1702257e0>>"
     )
     UITabBarButton为私有类:打印出来有个类,但是敲出来没有,说明这个类是系统私有类
     */

    int i = 0;
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            // 设置previousClickedTabBarButton默认值为最前面的按钮
            if (i == 0 && self.previousClickedTabBarButton == nil) {
                self.previousClickedTabBarButton = tabBarButton;
            }
            
            if (i == 2) {
                i += 1;
            }
            
            x = i * btnW;
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            i++;
            // UIControlEventTouchDownRepeat : 在短时间内连续点击按钮
            
            // 监听点击
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    // 调整加号按钮位置
    self.plusBtn.center = CGPointMake(self.sh_width * 0.5, self.sh_height * 0.5);
}


#pragma mark - tabBarButton的点击
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    
    if (self.previousClickedTabBarButton == tabBarButton) {
        // 发出通知，告知外界tabBarButton被重复点击了
        [[NSNotificationCenter defaultCenter] postNotificationName:SHTabBarButtonDidRepeatClickNotification object:nil];
    }
    self.previousClickedTabBarButton = tabBarButton;
}


#pragma mark - Getters

- (UIButton *)plusBtn
{
    if (!_plusBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:kImageName(@"tabBar_publish_icon") forState:UIControlStateNormal];
        [btn setImage:kImageName(@"tabBar_publish_click_icon") forState:UIControlStateHighlighted];
        [btn sizeToFit];
       // [btn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _plusBtn = btn;
    }
    return _plusBtn;
}

@end
