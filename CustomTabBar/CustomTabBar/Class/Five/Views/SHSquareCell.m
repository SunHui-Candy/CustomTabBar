//
//  SHSquareCell.m
//  CustomTabBar
//
//  Created by ios on 17/2/23.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHSquareCell.h"
#import "SHSquareItem.h"


@interface SHSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@end

@implementation SHSquareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(SHSquareItem *)item
{
    _item = item;
    [self.iconImageV sd_setImageWithURL:[NSURL URLWithString:item.icon] placeholderImage:kImageName(@"")];
    self.titleL.text = item.name;
}

@end
