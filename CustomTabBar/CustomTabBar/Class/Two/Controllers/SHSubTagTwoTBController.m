//
//  SHSubTagTwoTBController.m
//  CustomTabBar
//
//  Created by ios on 17/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHSubTagTwoTBController.h"
#import "SHSubTagTwoCell.h"
#import "SHSubTagItem.h" // 存放标签item

@interface SHSubTagTwoTBController ()

@property (nonatomic, strong) NSArray *subTagsArr;

@end

@implementation SHSubTagTwoTBController

#pragma mark - Private&Public Methods
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    [[SHAFNManger sharedManager].tasks makeObjectsPerformSelector:@selector(cancel)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示标签数据 -> 请求数据(接口文档) -> 解析数据(写成Plist)(image_list,sub_number,theme_name) -> 设计模型 -> 字典转模型 -> 展示数据
    [self loadData];

    self.title = @"推荐标签";
    
    // 处理cell分割线 1.自定义分割线 2.系统属性(iOS8才支持) 3.万能方式(重写cell的setFrame) 了解tableView底层实现了解 1.取消系统自带分割线 2.把tableView背景色设置为分割线的背景色 3.重写setFrame
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = RGBA(220, 220, 221,1);

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SHSubTagTwoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SHSubTagTwoCell class])];
    [SVProgressHUD showWithStatus:@"正在加载...."];
    
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTagsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SHSubTagTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHSubTagTwoCell class]) forIndexPath:indexPath];
    
    SHSubTagItem *item = self.subTagsArr[indexPath.row];
    cell.tagItem = item;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - Private&Public Methods

- (void)loadData
{
    
    [[SHAFNManger sharedManager]actionGetSubTagSuccess:^(NSArray *data) {
        [SVProgressHUD dismiss];

        
        self.subTagsArr = [SHSubTagItem mj_objectArrayWithKeyValuesArray:data];
//        SHLog(@"%@,%@",self.subTagsArr,data);
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];

    }];
    
}


@end









































