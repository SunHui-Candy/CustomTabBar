//
//  SHOneViewController.m
//  CustomTabBar
//
//  Created by ios on 17/1/4.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHOneViewController.h"
#import "SHTopicOneTBController.h"
#import "SHTopicTwoViewController.h"
#import "SHTopicThreeViewController.h"
#import "SHTopicFourViewController.h"
#import "SHTopicFiveViewController.h"


@interface SHOneViewController ()<UIScrollViewDelegate>

/** 标题栏 */
@property (nonatomic, weak) UIView *titlesView;

/** 标题下划线 */
@property (nonatomic, weak) UIView *titleUnderline;

/** 上一次点击的标题按钮 */
@property (nonatomic, weak) SHTitleBtn *previousClickedTitleBtn;

/** 用来存放所有子控制器view的scrollView */
@property (nonatomic, weak) UIScrollView *scrollView;


@end

@implementation SHOneViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = kOrangeMainColor;
    // 初始化子控制器
    [self setupAllChildVcs];
    
    // 设置导航条
    [self setupNavBar];
    
    // scrollView
    [self setupScrollView];

    // 标题栏
    [self setupTitlesView];
    
    // 添加第0个子控制器的view
    [self addChildVcViewIntoScrollView:0];

    
}

#pragma mark - Private&Public Methods
/**
 *  设置导航条
 */
- (void)setupNavBar
{
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:nil action:nil];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

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
    NSArray *titlesArr = @[@"第一个",@"第二个的",@"三个",@"四",@"第五个"];
    NSUInteger count = titlesArr.count;
    
    // 标题按钮的尺寸
    CGFloat titleBtnW = self.titlesView.sh_width / count;
    CGFloat titleBtnH = self.titlesView.sh_height;
    
    // 创建5个标题按钮
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
    
    self.titleUnderline.sh_width = firstTitleBtn.titleLabel.sh_width + SHMarin;
    self.titleUnderline.sh_centerX = firstTitleBtn.sh_centerX;
}

//初始化子控制器
- (void)setupAllChildVcs
{
    
    [self addChildViewController:[[SHTopicOneTBController alloc] init]];
    [self addChildViewController:[[SHTopicTwoViewController alloc] init]];
    [self addChildViewController:[[SHTopicThreeViewController alloc] init]];
    [self addChildViewController:[[SHTopicFourViewController alloc] init]];
    [self addChildViewController:[[SHTopicFiveViewController alloc] init]];
    
}


// scrollView
- (void)setupScrollView
{
    // 不允许自动修改UIScrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;

    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = self.scrollView.sh_width;
    self.scrollView.contentSize = CGSizeMake(scrollViewW *count, 0);
    
}

/**
 *  添加第index个子控制器的view到scrollView中
 */

- (void)addChildVcViewIntoScrollView:(NSUInteger)index
{
    UIViewController *childVc = self.childViewControllers[index];
    // 如果view已经被加载过，就直接返回
    if (childVc.isViewLoaded) return;
    // 取出index位置对应的子控制器view
    UIView *childVcView = childVc.view;
    
    //设置子控制器view的frame
    CGFloat scroollViewW = self.scrollView.sh_width;
    childVcView.frame = CGRectMake(index *scroollViewW, 0, scroollViewW, self.scrollView.sh_height);
    //添加子控制器的view到scrollview中
    [self.scrollView addSubview:childVcView];
}


#pragma mark - 按钮点击
/**
 *  点击标题按钮
 */
- (void)titleBtnClick:(SHTitleBtn *)titleButton
{

    // 重复点击了标题按钮
    if (self.previousClickedTitleBtn == titleButton) {
        [[NSNotificationCenter defaultCenter] postNotificationName:SHTitleButtonDidRepeatClickNotification object:nil];
    }

    
    
    // 处理标题按钮点击
    [self dealTitleButtonClick:titleButton];
}


- (void)dealTitleButtonClick:(SHTitleBtn *)titleButton
{
    // 切换按钮状态
    self.previousClickedTitleBtn.selected = NO;
    titleButton.selected = YES;
    self.previousClickedTitleBtn = titleButton;
    
    NSUInteger index = titleButton.tag;
    [UIView animateWithDuration:0.25 animations:^{
       
        //处理下划线
        self.titleUnderline.sh_width = titleButton.titleLabel.sh_width + SHMarin;
        self.titleUnderline.sh_centerX = titleButton.sh_centerX;
        
        //滚蛋scrollview
        CGFloat offsetX = self.scrollView.sh_width *index;
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
        
    } completion:^(BOOL finished) {
        // 添加子控制器的view
        [self addChildVcViewIntoScrollView:index];

    }];
    
    // 设置index位置对应的tableView.scrollsToTop = YES， 其他都设置为NO
    for (NSUInteger i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *childVc = self.childViewControllers[i];
        // 如果view还没有被创建，就不用去处理
        if (!childVc.isViewLoaded) continue;
        
        UIScrollView *scrollView = (UIScrollView *)childVc.view;
        if (![scrollView isKindOfClass:[UIScrollView class]]) continue;
        
        scrollView.scrollsToTop = (i == index);
    }
    
}


- (void)game
{
    SHFunc;
}

#pragma mark - <UIScrollViewDelegate>
/**
 *  当用户松开scrollView并且滑动结束时调用这个代理方法（scrollView停止滚动的时候）
 */

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //求出标题按钮的索引
    NSUInteger index = scrollView.contentOffset.x / scrollView.sh_width;
    //点击对应的标题按钮
    SHTitleBtn *titleBtn = self.titlesView.subviews[index];
    [self dealTitleButtonClick:titleBtn];
    
}
#pragma mark - Getters

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.backgroundColor = [UIColor blueColor];
        scrollView.frame = self.view.bounds;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.scrollsToTop = NO; // 点击状态栏的时候，这个scrollView不会滚动到最顶部
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

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






















