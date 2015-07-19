//
//  HMHomeViewController.m
//  05-自定义UIPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMHomeViewController.h"
#import "HMSecondViewController.h"
#import "HMTransition.h"

@interface HMHomeViewController ()


@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    HMSecondViewController *second = [[HMSecondViewController alloc] init];
    second.modalPresentationStyle = UIModalPresentationCustom;
    second.transitioningDelegate = [HMTransition sharedtransition];
    [self presentViewController:second animated:YES completion:nil];
}

@end
