//
//  HMIconView.m
//  04-QQ空间(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMIconView.h"

@implementation HMIconView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"lufy"] forState:UIControlStateNormal];
        [self setTitle:@"哈哈" forState:UIControlStateNormal];
        
        self.imageView.layer.cornerRadius = 10;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (Lanscape) {
        self.imageView.y = 0;
        self.imageView.width = self.width;
        self.imageView.height = self.width;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.imageView.height;
    } else { // 竖屏
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
    }
}

@end
