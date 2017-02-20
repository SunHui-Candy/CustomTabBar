//
//  SHNavigationController.m
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHNavigationController.h"

@interface SHNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SHNavigationController

#pragma mark - lifeCycle

+ (void)load
{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 只要是通过模型设置,都是通过富文本设置
    // 设置导航条标题 => UINavigationBar

    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = kFontSize(12);
    [navBar setTitleTextAttributes:attrs];
    
    // 设置导航条背景图片
    [navBar setBackgroundImage:kImageName(@"navigationbarBackgroundWhite") forBarMetrics:UIBarMetricsDefault];
    
}

// <_UINavigationInteractiveTransition: 0x7f9c948302a0>:手势代理

/*
 UIPanGestureRecognizer
 
 UIScreenEdgePanGestureRecognizer:导航滑动手势
 target=<_UINavigationInteractiveTransition 0x7fdc4a740440>)
 action=handleNavigationTransition:
 
 
 <UIScreenEdgePanGestureRecognizer: 0x7fdc4a740120; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fdc4a73e690>; target= <(action=handleNavigationTransition:, >>
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];

    pan.delegate = self;
    // 禁止之前手势,即只有在左边边缘返回的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 控制手势什么时候触发,只有非根控制器才需要触发手势

    return self.childViewControllers.count > 1;
}

// 重写系统的push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        // 非根控制器
        /*
         恢复滑动返回功能
         分析:把系统的返回按钮覆盖 -> 1.手势失效(1.手势被清空 2.可能手势代理做了一些事情,导致手势失效)
         */
        
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置返回按钮,只有非根控制器
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:kImageName(@"navigationButtonReturn") highImage:kImageName(@"navigationButtonReturnClick") target:self action:@selector(back) title:@"返回"];
        
    }
    
    // 真正在跳转
    [super pushViewController:viewController animated:animated];

}

#pragma mark - Private&Public Methods
- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
