//
//  ViewController.m
//  04-storyboard-控制器切换
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
}

// Attempting to badge the application icon but haven't received permission from the user to badge the application

@end
