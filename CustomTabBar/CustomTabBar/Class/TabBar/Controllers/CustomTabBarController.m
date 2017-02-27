//
//  CustomTabBarController.m
//  CustomTabBar
//
//  Created by ios on 16/12/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "CustomTabBarController.h"
#import "SHOneViewController.h"
#import "SHTwoViewController.h"
#import "SHThreeViewController.h"
#import "SHFourViewController.h"
#import "SHFiveViewController.h"
#import "UIImage+SHOriginalImage.h" 
#import "SHTabBar.h"
#import "SHNavigationController.h"

@interface CustomTabBarController ()


@end

@implementation CustomTabBarController

#pragma mark - lifeCicyle

+ (void)load
{
    // 获取哪个类中的UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 设置按钮选中标题的颜色
    NSMutableDictionary *attrsDic = [NSMutableDictionary dictionary];
    attrsDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrsDic forState:UIControlStateSelected];
    
    // 设置字体尺寸:注意,只有设置正常状态下才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setupAllChildViewControllersWithChildVC:[[SHOneViewController alloc] init] title:@"第一" image:@"tabBar_essence_icon" seletedImage:@"tabBar_essence_click_icon"];
    [self setupAllChildViewControllersWithChildVC:[[SHTwoViewController alloc] init] title:@"第二" image:@"tabBar_new_icon" seletedImage:@"tabBar_new_click_icon"];
    [self setupAllChildViewControllersWithChildVC:[[SHFourViewController alloc] init] title:@"第四" image:@"tabBar_friendTrends_icon" seletedImage:@"tabBar_friendTrends_click_icon"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([SHFiveViewController class]) bundle:nil];
    // 加载箭头指向控制器
    SHFiveViewController *meVc = [storyboard instantiateInitialViewController];
    
    [self setupAllChildViewControllersWithChildVC:meVc title:@"第五" image:@"tabBar_me_icon" seletedImage:@"tabBar_me_click_icon"];
    

    //自定义tabBar
    [self setupTabBar];
    
}


#pragma mark - Private&Public Methods

- (void)setupTabBar
{
    SHTabBar *tabBar = [[SHTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];

}
// 给子控制器添加导航,设置标题文字,图片和选中图片
- (void)setupAllChildViewControllersWithChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *) imageName seletedImage:(NSString *)seletedImageName
{
    SHNavigationController *nav = [[SHNavigationController alloc] initWithRootViewController:childVC];
    
    // 设置tabbar上的按钮内容,由对应的子控制器的tabBarItem属性设置
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    //imageOriginalWithName 自定义分类,得到一张没有被渲染的原始图片
    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:seletedImageName];
    [self addChildViewController:nav];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
