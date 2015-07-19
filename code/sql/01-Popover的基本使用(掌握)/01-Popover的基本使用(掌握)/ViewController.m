//
//  ViewController.m
//  01-Popover的基本使用(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMMenuViewController.h"

@interface ViewController ()
- (IBAction)popMenu:(id)item;
@property (nonatomic, strong) UIPopoverController *popover;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// -[UIPopoverController dealloc] reached while popover is still visible.
// 当popover还在显示的时候,它就挂了
// 不允许popover还在显示的时候挂掉
// popover必须在消失的时候挂掉

/**
 *  弹出Popover菜单
 */
- (IBAction)popMenu:(id)item {
    // 0.内容
    HMMenuViewController *menu = [[HMMenuViewController alloc] init];
    
    // 1.创建一个UIPopover
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:[[UINavigationController alloc] initWithRootViewController:menu]];
    
    // 2.设置尺寸
//    popover.popoverContentSize = CGSizeMake(320, 44 * 5);
    
    // 3.从哪里显示出来 --> 指向item
    [popover presentPopoverFromBarButtonItem:item permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    self.popover = popover;
}
@end
