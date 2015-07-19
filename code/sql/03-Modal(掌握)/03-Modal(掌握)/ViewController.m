//
//  ViewController.m
//  03-Modal(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    SecondViewController *second = [[SecondViewController alloc] init];
    second.view.backgroundColor = [UIColor redColor];
    /**
     UIModalPresentationFullScreen = 0,
     UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2),
     UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2),
     */
    second.modalPresentationStyle = UIModalPresentationFormSheet;
    
    /**
     UIModalTransitionStyleCoverVertical = 0,
     UIModalTransitionStyleFlipHorizontal,
     UIModalTransitionStyleCrossDissolve,
     UIModalTransitionStylePartialCurl
     */
    second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:second animated:YES completion:nil];
}

@end
