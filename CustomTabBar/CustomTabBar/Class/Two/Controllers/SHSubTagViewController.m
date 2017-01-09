//
//  SHSubTagViewController.m
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHSubTagViewController.h"
#import "SHTagOneViewController.h" // 标签一
#import "SHTagTwoViewController.h" // 标签二

@interface SHSubTagViewController ()

@property (nonatomic, strong) SHTagOneViewController *tagOneVC;
@property (nonatomic, strong) SHTagTwoViewController *tagTwoVC;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

@implementation SHSubTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiterColor;
    
    self.tagOneVC= [[SHTagOneViewController alloc] init];
    [self addChildViewController:self.tagOneVC];
    
    self.tagTwoVC = [[SHTagTwoViewController alloc] init];
    [self addChildViewController:self.tagTwoVC];
    
    self.navigationItem.titleView = self.segmentedControl;

}

#pragma mark - Private&Public Methods

- (void)segmentedClick
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [self.view addSubview:self.tagOneVC.view];
        
    }else if(self.segmentedControl.selectedSegmentIndex == 1){
        [self.view addSubview:self.tagTwoVC.view];

    }
}

#pragma mark - Getters
- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl) {
        /**
         设置titleView
         分段选择UISegmentedControl
         */
         _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"标签一",@"标签二"]];

        [_segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        [_segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
        // 设置字体属性
        [_segmentedControl setTitleTextAttributes:@{
                                                   NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                   NSForegroundColorAttributeName:kBlackColor
                                                   } forState:UIControlStateNormal];
        // 设置选中的索引
        _segmentedControl.selectedSegmentIndex = 0;
        [self segmentedClick];
        
        // 设置前景色
        _segmentedControl.tintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1.0];
        [_segmentedControl addTarget:self action:@selector(segmentedClick) forControlEvents:UIControlEventValueChanged];

    }
    return _segmentedControl;
}

@end
