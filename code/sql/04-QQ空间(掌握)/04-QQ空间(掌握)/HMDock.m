//
//  HMDock.m
//  04-QQ空间(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMDock.h"
#import "HMIconView.h"
#import "HMTabBar.h"
#import "HMToolbar.h"

@interface HMDock()
@property (nonatomic, weak) HMIconView *iconView;
@property (nonatomic, weak) HMTabBar *tabBar;
@property (nonatomic, weak) HMToolbar *toolbar;
@end

@implementation HMDock

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 1.头像
        HMIconView *iconView = [[HMIconView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        // 2.tabbar
        HMTabBar *tabBar = [[HMTabBar alloc] init];
        [self addSubview:tabBar];
        self.tabBar = tabBar;

        // 3.toolbar
        HMToolbar *toolbar = [[HMToolbar alloc] init];
        [self addSubview:toolbar];
        self.toolbar = toolbar;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.toolbar.width = self.width;
    self.tabBar.width = self.width;
    self.tabBar.height = self.tabBar.subviews.count * HMDockPW;
    
    if (Lanscape) { // 横屏
        self.toolbar.height = self.width / self.toolbar.subviews.count;
        
        self.iconView.width = self.width * 0.4;
        self.iconView.height = self.iconView.width + 40;
        self.iconView.x = (self.width - self.iconView.width) * 0.5;
        self.iconView.y = 70;
    } else { // 竖屏
        self.toolbar.height = self.width * self.toolbar.subviews.count;
        
        self.iconView.x = 5;
        self.iconView.y = 50;
        self.iconView.width = self.width - 2 * self.iconView.x;
        self.iconView.height = self.iconView.width;
    }
    self.toolbar.y = self.height - self.toolbar.height;
    self.tabBar.y = self.toolbar.y - self.tabBar.height;
}

@end
