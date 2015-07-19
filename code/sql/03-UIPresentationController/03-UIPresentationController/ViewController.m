//
//  ViewController.m
//  03-UIPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMSecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    HMSecondViewController *second = [[HMSecondViewController alloc] init];
//    second.modalPresentationStyle = UIModalPresentationPopover;
//    second.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    [self presentViewController:second animated:YES completion:nil];
    NSLog(@"%@ %@", second.presentationController, second.popoverPresentationController);
}

// 1.只要调用了[self presentViewController:second animated:YES completion:nil];方法
// 2.首先会创建一个UIPresentationController
// 3.然后由UIPresentationController管理控制器的切换

@end
