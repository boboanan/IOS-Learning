//
//  HMColorsViewController.h
//  02-Popover的其他用法（掌握）
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMColorsViewController;

@protocol HMColorsViewControllerDelegate <NSObject>

@optional
- (void)colorsViewController:(HMColorsViewController *)vc didSelectColor:(UIColor *)color;
@end

@interface HMColorsViewController : UITableViewController
@property (nonatomic, weak) id<HMColorsViewControllerDelegate> delegate;
@end
