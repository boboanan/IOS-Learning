//
//  ViewController.m
//  05-自定义UIPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMSecondViewController.h"
#import "HMPresentationController.h"
#import "UIView+Extension.h"
#import "HMAnimatedTransitioning.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)testSecond
{
    HMSecondViewController *second = [[HMSecondViewController alloc] init];
    // 设置展示样式(自定义)
    second.modalPresentationStyle = UIModalPresentationCustom;
    
    // 设置代理(设置UIPresentationController)
    second.transitioningDelegate = self;
    [self presentViewController:second animated:YES completion:nil];
    
    // 设置动画样式
    //    second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[HMPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    HMAnimatedTransitioning *anim = [[HMAnimatedTransitioning alloc] init];
    anim.presented = YES;
    return anim;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    HMAnimatedTransitioning *anim = [[HMAnimatedTransitioning alloc] init];
    anim.presented = NO;
    return anim;
}
@end
