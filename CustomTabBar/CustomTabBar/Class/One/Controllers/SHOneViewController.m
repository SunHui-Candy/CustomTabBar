//
//  SHOneViewController.m
//  CustomTabBar
//
//  Created by ios on 17/1/4.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHOneViewController.h"

@interface SHOneViewController ()

/** 标题栏 */
@property (nonatomic, weak) UIView *titlesView;

/** 标题下划线 */
@property (nonatomic, weak) UIView *titleUnderline;

/** 上一次点击的标题按钮 */
@property (nonatomic, weak) SHTitleBtn *previousClickedTitleBtn;

@end

@implementation SHOneViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kWhiterColor;
    // 初始化子控制器
    [self setupAllChildVcs];
    
    [self setupTitlesView];
    
}

#pragma mark - Private&Public Methods

/**
 *  标题栏
 */
- (void)setupTitlesView
{
    [self setupTitleButtons];
    [self setupTitleUnderline];
    
}

/**
 *  标题栏按钮
 */
- (void)setupTitleButtons
{
    // 文字
    NSArray *titlesArr = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个"];
    NSUInteger count = titlesArr.count;
    
    // 标题按钮的尺寸
    CGFloat titleBtnW = self.titlesView.sh_width / count;
    CGFloat titleBtnH = self.titlesView.sh_height;
    
    //
    for (NSInteger i = 0; i < count; i++) {
        SHTitleBtn *titleBtn = [[SHTitleBtn alloc] init];
        titleBtn.tag = i;
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titlesView addSubview:titleBtn];
        titleBtn.frame = CGRectMake(i *titleBtnW, 0, titleBtnW, titleBtnH);
        [titleBtn setTitle:titlesArr[i] forState:UIControlStateNormal];
    }
    
}

/*
*  标题下划线
*/
- (void)setupTitleUnderline
{
    //标题按钮
    SHTitleBtn *firstTitleBtn = self.titlesView.subviews.firstObject;
    self.titleUnderline.backgroundColor = [firstTitleBtn titleColorForState:UIControlStateSelected];
 
    // 切换按钮状态
    firstTitleBtn.selected = YES;
    self.previousClickedTitleBtn = firstTitleBtn;
    [firstTitleBtn.titleLabel sizeToFit]; // 让label根据文字内容计算尺寸
    
    
    
}

- (void)setupAllChildVcs
{
    
}

#pragma mark - Getters
- (UIView *)titlesView
{
    if (!_titlesView) {
        UIView *titlesView = [[UIView alloc] init];
        titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        titlesView.frame = CGRectMake(0, SHNavMaxY, self.view.sh_width, SHTitlesViewH);
        [self.view addSubview:titlesView];
        _titlesView = titlesView;
    }
    return _titlesView;
}


- (UIView *)titleUnderline
{
    if (!_titleUnderline) {
        
        UIView *titleUnderLine = [[UIView alloc] init];
        titleUnderLine.sh_height = 2;
        titleUnderLine.sh_y = self.titlesView.sh_height - titleUnderLine.sh_height;
        [self.titlesView addSubview:titleUnderLine];
        _titleUnderline = titleUnderLine;
        
    }
    return _titleUnderline;
}

@end






















