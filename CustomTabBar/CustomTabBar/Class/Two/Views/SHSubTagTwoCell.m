//
//  SHSubTagTwoCell.m
//  CustomTabBar
//
//  Created by ios on 17/1/10.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHSubTagTwoCell.h"
#import "SHSubTagItem.h"

@interface SHSubTagTwoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *numL;

@end

@implementation SHSubTagTwoCell

#pragma mark - Getters
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}


/*
 头像变成圆角 1.设置头像圆角 2.裁剪图片(生成新的图片 -> 图形上下文才能够生成新图片)
 处理数字
 */

- (void)setTagItem:(SHSubTagItem *)tagItem
{
    _tagItem = tagItem;
    _nameL.text = tagItem.theme_name;
    
    // 判断下有没有>10000
    [self resolveNum];
    
    // 设置头像
    [_iconImageV sh_setHeader:tagItem.image_list];
    
}

// 处理订阅数字
- (void)resolveNum
{
    NSString *numStr = kFormat(@"%@人订阅", _tagItem.sub_number);
    NSInteger num = _tagItem.sub_number.integerValue;
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        numStr = kFormat(@"%.1f万人订阅", numF);
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    _numL.text = numStr;
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
