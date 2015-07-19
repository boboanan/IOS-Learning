//
//  HMHomeViewController.m
//  04-QQ空间(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMHomeViewController.h"
#import "HMDock.h"
#import "Masonry.h"

@interface HMHomeViewController ()
@property (nonatomic, weak) HMDock *dock;
/** 正在显示的子控制器 */
@property (nonatomic, weak) UIViewController *showingChildVc;
@end

@implementation HMHomeViewController

- (HMDock *)dock
{
    if (!_dock) {
        HMDock *dock = [[HMDock alloc] init];
        [self.view addSubview:dock];
        self.dock = dock;
    }
    return _dock;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景色
    self.view.backgroundColor = HMColor(55, 55, 55);
    
    // 初始化子控制器
    [self setupChildVcs];
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidSelect:) name:HMTabBarDidSelectNotification object:nil];
    
    // 根据屏幕方向设置dock的属性
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  初始化子控制器
 */
- (void)setupChildVcs
{
    for (int i = 0; i<6; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = HMRandomColor;
        [self addChildViewController:vc];
    }
    
    // 默认选中第0个控制器
    [self switchChildVc:0];
}

- (void)tabBarDidSelect:(NSNotification *)notification
{
    int index = [notification.userInfo[HMTabBarSelectIndex] intValue];
    
    [self switchChildVc:index];
}

/**
 *  切换子控制器
 *
 *  @param index 最新子控制器的索引
 */
- (void)switchChildVc:(int)index
{
    // 切换子控制器
    // 移除当前正在显示的子控制器
    [self.showingChildVc.view removeFromSuperview];
    
    // 显示index对应的子控制器
    UIViewController *newChildVc = self.childViewControllers[index];
    [self.view addSubview:newChildVc.view];
    self.showingChildVc = newChildVc;
    
    // 添加约束
    [newChildVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.mas_equalTo(600);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.dock.mas_right);
    }];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) { // 横屏
        self.dock.width = HMDockLW;
        self.dock.height = HMScreenPW;
    } else { // 竖屏
        self.dock.width = HMDockPW;
        self.dock.height = HMScreenLW;
    }
    
//    self.showingChildVc.view.autoresizingMask = UIViewAutoresizingNone;
    // 默认情况下,所有控制器的view.autoresizingMask里面都包含了UIViewAutoresizingFlexibleWidth和UIViewAutoresizingFlexibleHeight
}
@end
