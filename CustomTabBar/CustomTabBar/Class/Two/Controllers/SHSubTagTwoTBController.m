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

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示标签数据 -> 请求数据(接口文档) -> 解析数据(写成Plist)(image_list,sub_number,theme_name) -> 设计模型 -> 字典转模型 -> 展示数据
    [self loadData];

    self.title = @"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SHSubTagTwoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SHSubTagTwoCell class])];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTagsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SHSubTagTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHSubTagTwoCell class]) forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - Private&Public Methods

- (void)loadData
{
    [[SHAFNManger sharedManager]actionGetSubTagSuccess:^(NSArray *data) {
        
        
        self.subTagsArr = [SHSubTagItem mj_objectArrayWithKeyValuesArray:data];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}


@end









































