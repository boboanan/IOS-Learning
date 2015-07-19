//
//  ViewController.m
//  02-UIPopoverPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMSecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController
// UIPopoverController只能用在iPad

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    HMSecondViewController *vc = [[HMSecondViewController alloc] init];
    // modal出来是个popover
    vc.modalPresentationStyle = UIModalPresentationPopover;
    // 取出vc所在的UIPopoverPresentationController
    vc.popoverPresentationController.sourceView = self.slider;
    vc.popoverPresentationController.sourceRect = self.slider.bounds;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)popover
{
    HMSecondViewController *vc = [[HMSecondViewController alloc] init];
    
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    [popover presentPopoverFromRect:self.slider.bounds inView:self.slider permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end
