//
//  ViewController.m
//  02-Popover的其他用法（掌握）
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMColorsViewController.h"

@interface ViewController () <HMColorsViewControllerDelegate, UIPopoverControllerDelegate>
- (IBAction)buttonClick:(UIButton *)btn;
@property (nonatomic, weak) UIButton *colorButton;
@property (nonatomic, strong) UIPopoverController *popover;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;

- (IBAction)greenButtonClick;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)greenButtonClick {
    NSLog(@"greenButtonClick");
}

- (IBAction)buttonClick:(UIButton *)btn {
    // 0.内容
    HMColorsViewController *colors = [[HMColorsViewController alloc] init];
    colors.delegate = self;
    
    // 1.创建
    self.popover = [[UIPopoverController alloc] initWithContentViewController:colors];
    self.popover.delegate = self;
    
    // 2.显示
//    [self.popover presentPopoverFromRect:CGRectMake(150, 150, 100, 100) inView:btn.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    [self.popover presentPopoverFromRect:CGRectMake(924, 668, 100, 100) inView:btn.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//    [self.popover presentPopoverFromRect:btn.bounds inView:btn permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//    [self.popover presentPopoverFromRect:btn.frame inView:btn.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    // 3.设置哪里控件在popover显示出来的时候,仍旧可以跟用户进行交互
    self.popover.passthroughViews = @[self.greenButton];
    
    self.colorButton = btn;
}

#pragma mark - 颜色选择代理
- (void)colorsViewController:(HMColorsViewController *)vc didSelectColor:(UIColor *)color
{
    self.colorButton.backgroundColor = color;
    
    // 关闭popover
    [self.popover dismissPopoverAnimated:YES];
}

#pragma mark - popover的代理
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
//    NSLog(@"popover销毁了");
}
@end
