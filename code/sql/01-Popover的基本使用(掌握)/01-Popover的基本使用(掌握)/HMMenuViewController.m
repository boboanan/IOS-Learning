//
//  HMMenuViewController.m
//  01-Popover的基本使用(掌握)
//
//  Created by apple on 14/11/21.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMMenuViewController.h"

@interface HMMenuViewController ()
@property (nonatomic, strong) NSArray *titles;
@end

@implementation HMMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"设置", @"清除缓存", @"退出", @"基本信息"];
    self.title = @"菜单";
    self.view.backgroundColor = [UIColor blueColor];
    
    CGFloat w = 320;
    CGFloat h = self.titles.count * 44;
    self.preferredContentSize = CGSizeMake(w, h);
//    self.contentSizeForViewInPopover = CGSizeMake(w, h);
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
