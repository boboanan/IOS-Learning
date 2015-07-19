//
//  HMViewController.m
//  02-FMDB(掌握)
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
//#import "FMDB.h"
#import "HMShop.h"
#import "HMShopTool.h"

@interface HMViewController ()
//@property (nonatomic, strong) FMDatabase *db;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1.打开数据库
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"shops.sqlite"];
//    self.db = [FMDatabase databaseWithPath:path];
//    [self.db open];
//    
//    // 2.创表
//    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_shop (id integer PRIMARY KEY, name text NOT NULL, price real);"];
    // executeQuery:查询数据
//    [self.db executeQuery:<#(NSString *), ...#>];
    
    // executeUpdate:除查询数据以外的其他操作
//    [self.db executeUpdate:<#(NSString *), ...#>];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    for (int i = 0; i<100; i++) {
//        HMShop *shop = [[HMShop alloc] init];
//        shop.name = [NSString stringWithFormat:@"枕头--%d", i];
//        shop.price = arc4random() % 200;
//        [HMShopTool addShop:shop];
//    }
    
    NSArray *shops = [HMShopTool shops];
    for (HMShop *shop in shops) {
        NSLog(@"%@ %f", shop.name, shop.price);
    }
    
//    [self.db executeUpdate:@"DELETE FROM t_shop WHERE price < 800;"];
//    
//    [self query];
}

- (void)query
{
    // 得到结果集
//    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM t_shop;"];
//    
//    // 不断往下取数据
//    while (set.next) {
//        // 获得当前所指向的数据
//        NSString *name = [set stringForColumn:@"name"];
//        double price = [set doubleForColumn:@"price"];
//        NSLog(@"%@ %f", name, price);
//    }
}

- (void)insert
{
//    for (int i = 0; i<100; i++) {
//        NSString *name = [NSString stringWithFormat:@"手机-%d", i];
//#warning 这里的字符串不用再加上''
//        [self.db executeUpdateWithFormat:@"INSERT INTO t_shop(name, price) VALUES (%@, %d);", name, arc4random()%1000];
//    }
}

@end
