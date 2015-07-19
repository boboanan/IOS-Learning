//
//  HMTabBar.m
//  04-QQ空间(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMTabBar.h"
#import "HMTabBarButton.h"

@interface HMTabBar()
@property (nonatomic, weak) HMTabBarButton *selelctedButton;
@end

@implementation HMTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建按钮
        HMTabBarButton *firstButton = [self setupButton:@"tab_bar_friend_icon" title:@"aaaa"];
        firstButton.enabled = NO;
        self.selelctedButton = firstButton;
        
        [self setupButton:@"tab_bar_friend_icon" title:@"bbb"];
        [self setupButton:@"tab_bar_friend_icon" title:@"cc"];
        [self setupButton:@"tab_bar_friend_icon" title:@"77567"];
        [self setupButton:@"tab_bar_friend_icon" title:@"987"];
        [self setupButton:@"tab_bar_friend_icon" title:@"6757"];
    }
    return self;
}

- (HMTabBarButton *)setupButton:(NSString *)icon title:(NSString *)title
{
    HMTabBarButton *button = [[HMTabBarButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    return button;
}

- (void)buttonClick:(HMTabBarButton *)button
{
    self.selelctedButton.enabled = YES;
    button.enabled = NO; // button进入highlighted\disabled,图标默认会变灰
    self.selelctedButton = button;
    
    // 发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:HMTabBarDidSelectNotification object:nil userInfo:@{HMTabBarSelectIndex : @(button.tag)}];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    for (int i = 0; i<count; i++) {
        HMTabBarButton *button = self.subviews[i];
        button.height = self.height / count;
        button.width = self.width;
        button.x = 0;
        button.y = button.height * i;
        button.tag = i;
    }
}
@end
