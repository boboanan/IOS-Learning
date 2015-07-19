//
//  HMGreenView.m
//  事件处理
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMGreenView.h"
#import "HMRedView.h"

@interface HMGreenView()
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) HMRedView *redView;
@end

@implementation HMGreenView

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor greenColor];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    button.center = CGPointMake(100, 100);
//    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:button];
//    self.button = button;
    
    HMRedView *redView = [[HMRedView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    [self addSubview:redView];
    self.redView = redView;
}

//- (void)click
//{
//    NSLog(@"点击了按钮");
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"HMGreenView----touchesBegan");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return self.redView;
}
@end
