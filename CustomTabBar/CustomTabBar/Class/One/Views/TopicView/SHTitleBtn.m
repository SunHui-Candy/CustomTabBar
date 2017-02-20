//
//  SHTitleBtn.m
//  CustomTabBar
//
//  Created by ios on 17/1/13.
//  Copyright © 2017年 ios. All rights reserved.
//

/*
 特定构造方法
 1> 后面带有NS_DESIGNATED_INITIALIZER的方法，就是特定构造方法
 
 2> 子类如果重写了父类的【特定构造方法】，那么必须用super调用父类的【特定构造方法】，不然会出现警告
 */

/*
 警告信息:Designated initializer missing a 'super' call to a designated initializer of the super class
 意思：【特定构造方法】缺少super去调用父类的【特定构造方法】
 */


#import "SHTitleBtn.h"

@implementation SHTitleBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{ // 只要重写了这个方法，按钮就无法进入highlighted状态
    
}

@end
