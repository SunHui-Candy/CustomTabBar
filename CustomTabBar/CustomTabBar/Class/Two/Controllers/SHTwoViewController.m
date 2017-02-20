//
//  SHTwoViewController.m
//  CustomTabBar
//
//  Created by ios on 17/1/4.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHTwoViewController.h"
#import "SHSubTagViewController.h" // segment类
#import "SHSubTagTwoTBController.h" // 标签类


@interface SHTwoViewController ()

@end

@implementation SHTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kOrangeMainColor;
    [self setupNavBar];

}

#pragma mark - Private&Public Methods
//设置导航条
- (void)setupNavBar
{
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:kImageName(@"MainTagSubIcon") highImage:kImageName(@"MainTagSubIconClick") target:self action:@selector(tagClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithimage:kImageName(@"MainTagSubIcon") highImage:kImageName(@"MainTagSubIconClick") target:self action:@selector(tagRightClick)];
}

#pragma mark - 点击订阅标签调用
- (void)tagClick
{
    // 进入推荐标签界面
    SHSubTagViewController *subVC = [[SHSubTagViewController alloc]init];
    [self.navigationController pushViewController:subVC animated:YES];
}

- (void)tagRightClick
{
    // 进入推荐标签界面
    SHSubTagTwoTBController *subRightVC = [[SHSubTagTwoTBController alloc]init];
    [self.navigationController pushViewController:subRightVC animated:YES];

}

@end





















