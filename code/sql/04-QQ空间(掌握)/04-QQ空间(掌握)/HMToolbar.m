//
//  HMToolbar.m
//  04-QQ空间(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMToolbar.h"

@implementation HMToolbar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建按钮
        [self setupButton:@"tabbar_photo"];
        [self setupButton:@"tabbar_mood"];
        [self setupButton:@"tabbar_blog"];
    }
    return self;
}

- (void)setupButton:(NSString *)icon
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:button];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    if (Lanscape) { // 横屏
        for (int i = 0; i<count; i++) {
            UIButton *button = self.subviews[i];
            button.height = self.height;
            button.width = self.width / count;
            button.y = 0;
            button.x = button.width * i;
        }
    } else {
        for (int i = 0; i<count; i++) {
            UIButton *button = self.subviews[i];
            button.width = self.width;
            button.height = self.height / count;
            button.x = 0;
            button.y = button.height * i;
        }
    }
}

@end
