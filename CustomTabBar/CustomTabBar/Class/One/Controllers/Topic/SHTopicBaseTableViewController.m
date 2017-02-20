//
//  SHTopicBaseTableViewController.m
//  CustomTabBar
//
//  Created by ios on 17/1/13.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHTopicBaseTableViewController.h"

@interface SHTopicBaseTableViewController ()

@property (nonatomic, strong) NSMutableArray *topicArr;

@end


@implementation SHTopicBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kCellLightGrayColor;
    self.tableView.contentInset = UIEdgeInsetsMake(SHNavMaxY + SHTitlesViewH, 0, SHTabBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
}


/*
 [[SHVideoViewController alloc] init]
 1.SHVideoViewController.xib
 2.SHVideoView.xib
 
 报错信息：-[UIViewController _loadViewFromNibNamed:bundle:] loaded the "SHVideoView" nib but the view outlet was not set.
 错误原因：在使用xib创建控制器view时，并没有通过File's Owner设置控制器的view属性
 解决方案：通过File's Owner设置控制器的view属性为某一个view
 
 报错信息：-[UITableViewController loadView] loaded the "SHVideoView" nib but didn't get a UITableView.
 错误原因：在使用xib创建UITableViewController的view时，并没有设置控制器的view为一个UITableView
 解决方案：通过File's Owner设置控制器的view属性为一个UITableView
 */



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - Getters
- (NSMutableArray *)topicArr
{
    if (!_topicArr) {
        _topicArr = [NSMutableArray array];
    }
    return _topicArr;
}

@end
