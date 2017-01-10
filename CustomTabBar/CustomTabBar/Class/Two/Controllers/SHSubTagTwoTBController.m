//
//  SHSubTagTwoTBController.m
//  CustomTabBar
//
//  Created by ios on 17/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHSubTagTwoTBController.h"
#import "SHSubTagTwoCell.h"


@interface SHSubTagTwoTBController ()

@property (nonatomic, weak) NSMutableArray *dataArrM;

@end

@implementation SHSubTagTwoTBController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示标签数据 -> 请求数据(接口文档) -> 解析数据(写成Plist)(image_list,sub_number,theme_name) -> 设计模型 -> 字典转模型 -> 展示数据
    [self loadData];

    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SHSubTagTwoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SHSubTagTwoCell class])];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrM.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SHSubTagTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHSubTagTwoCell class]) forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - Private&Public Methods

- (void)loadData
{
    
}

#pragma mark - Getters
- (NSMutableArray *)dataArrM
{
    if (!_dataArrM) {
        _dataArrM = [NSMutableArray array];
    }
    return _dataArrM;
}

@end








































