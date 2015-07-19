//
//  HMViewController.m
//  下拉方法
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"

const CGFloat HMTopViewH = 350;

@interface HMViewController ()
@property (nonatomic, weak) UIImageView *topView;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置内边距(让cell往下移动一段距离)
    self.tableView.contentInset = UIEdgeInsetsMake(HMTopViewH * 0.5, 0, 0, 0);
    
    UIImageView *topView = [[UIImageView alloc] init];
    topView.image = [UIImage imageNamed:@"biaoqingdi"];
    topView.frame = CGRectMake(0, -HMTopViewH, 320, HMTopViewH);
    topView.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView insertSubview:topView atIndex:0];
    self.topView = topView;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据---%d", indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 向下拽了多少距离
    CGFloat down = -(HMTopViewH * 0.5) - scrollView.contentOffset.y;
    if (down < 0) return;
    
    CGRect frame = self.topView.frame;
    // 5决定图片变大的速度,值越大,速度越快
    frame.size.height = HMTopViewH + down * 5;
    self.topView.frame = frame;
}

@end
