//
//  SHFiveViewController.m
//  CustomTabBar
//
//  Created by ios on 17/1/9.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHFiveViewController.h"
#import "SHSquareItem.h"
#import "SHSquareCell.h"

static NSString * const ID = @"cell";
static NSInteger const cols = 4;
static CGFloat const margin = 1;


#define itemWH (SHScreenW - (cols - 1) * margin) / cols


@interface SHFiveViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *squareItems;

// 创建UICollectionView
@property (nonatomic,weak) UICollectionView *collectionView;

@end

@implementation SHFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条
    [self setupNavBar];

    // 设置tableView底部视图
    [self setupFootView];
    
    // 展示方块内容 -> 请求数据(查看接口文档)
    [self loadData];

    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = SHMarin;
    self.tableView.contentInset = UIEdgeInsetsMake(SHMarin - 35, 0, 0, 0);
    
}

#pragma mark - UICollectionViewDataSource & UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 从缓存池取
     SHSquareCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.item = self.squareItems[indexPath.row];
    
    return cell;
}

#pragma mark - 请求数据
- (void)loadData
{
   /*
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    
    // 3.发送请求
    [mgr GET:SHCommonURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        NSArray *dictArr = responseObject[@"square_list"];
        
        // 字典数组转换成模型数组
        _squareItems = [SHSquareItem mj_objectArrayWithKeyValuesArray:dictArr];
        
        // 处理数据
        [self resloveData];
        
        // 设置collectionView 计算collectionView高度 = rows * itemWH
        // Rows = (count - 1) / cols + 1  3 cols4
        NSInteger count = _squareItems.count;
        NSInteger rows = (count - 1) / cols + 1;
        // 设置collectioView高度
        self.collectionView.sh_height = rows * itemWH;
        
        // 设置tableView滚动范围:自己计算
        self.tableView.tableFooterView = self.collectionView;
        // 刷新表格
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    */
    
    [[SHAFNManger sharedManager]actionGetFiveCollectionDataSuccess:^(NSDictionary *data) {
        NSLog(@"数据,%@",data);
        NSArray *dictArr = data[@"square_list"];

        self.squareItems = [SHSquareItem mj_objectArrayWithKeyValuesArray:dictArr];
        // 处理数据
        [self resloveData];
        
        // 设置collectionView 计算collectionView高度 = rows * itemWH
        //万能公式: 行数= (个数-1)除以列数 + 1;
        // Rows = (count - 1) / cols + 1  3 cols4
        NSInteger count = self.squareItems.count;
        NSInteger rows = (count - 1) / cols + 1;
        // 设置collectioView高度
        self.collectionView.sh_height = rows *itemWH;
        // 设置tableView滚动范围:自己计算
        self.tableView.tableFooterView = self.collectionView;
        
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - 处理请求完成数据
- (void)resloveData
{
    // 判断下缺几个
    // 3 % 4 = 3 cols - 3 = 1
    // 5 % 4 = 1 cols - 1 = 3
    // 补空位置
    NSInteger count = self.squareItems.count;
    NSInteger exter = count % cols;
    if (exter) {
        exter = cols - exter;
        for (int i = 0; i < exter; i++) {
            SHSquareItem *item = [[SHSquareItem alloc] init];
            [self.squareItems addObject:item];
        }
    }
    
    
}
#pragma mark - Private&Public Mthods
- (void)setupNavBar
{
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    
    // 设置
    UIBarButtonItem *settingItem =  [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    // 夜间模型
    UIBarButtonItem *nightItem =  [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    
    // titleView
    self.navigationItem.title = @"我的";
    
}


- (void)setupFootView
{
    self.tableView.tableFooterView = self.collectionView;

}

#pragma mark - 监听点击事件

- (void)setting
{
    
}

- (void)night:(UIButton *)button
{
    button.selected = !button.selected;
}

#pragma mark - Getters
-(NSMutableArray *)squareItems
{
    if (!_squareItems) {
        _squareItems = [NSMutableArray array];
    }
    return _squareItems;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        // 创建布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        // 设置cell尺寸
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;

        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
        collectionView.backgroundColor = self.tableView.backgroundColor;

        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.scrollEnabled = NO;
        // 注册cell
        [collectionView registerNib:[UINib nibWithNibName:@"SHSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
        
        _collectionView = collectionView;
        
    }
    return _collectionView;
}

@end
