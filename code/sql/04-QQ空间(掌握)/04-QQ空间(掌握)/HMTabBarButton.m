//
//  HMTabBarButton.m
//  04-QQ空间(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMTabBarButton.h"

@implementation HMTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.adjustsImageWhenDisabled = NO;
        self.adjustsImageWhenHighlighted = NO;
        
        // 设置按钮的内容向左边对齐
//        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        // 设置内边距
//        CGFloat inset = 30;
//        self.contentEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
//        self.titleEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (Lanscape) {
        self.imageView.height = self.height;
        self.imageView.width = self.width * 0.4;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.y = 0;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
    } else {
        self.titleLabel.hidden = YES;
        // 如果设置宽度或者高度为0,某个控件还是会显示一部分, 可以尝试设置控件的width或者height为负数
//        self.titleLabel.frame = CGRectMake(0, 0, -1, 0);
        self.imageView.frame = self.bounds;
    }
}

@end
