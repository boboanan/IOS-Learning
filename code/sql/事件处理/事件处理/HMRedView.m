//
//  HMRedView.m
//  事件处理
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMRedView.h"

@implementation HMRedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"HMRedView----touchesBegan");
}
@end
