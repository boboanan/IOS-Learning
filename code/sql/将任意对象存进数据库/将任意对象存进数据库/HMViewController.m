//
//  HMViewController.m
//  将任意对象存进数据库
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"
#import "HMShop.h"
#import "FMDB.h"

@interface HMViewController ()
@property (nonatomic, strong) FMDatabase *db;
@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setup];
    
    [self readShops];
}

- (void)setup
{
    // 初始化
    NSString *path = @"/Users/apple/Desktop/shops.data";
    self.db = [FMDatabase databaseWithPath:path];
    [self.db open];
    
    // 2.创表
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_shop (id integer PRIMARY KEY, shop blob NOT NULL);"];
}

- (void)readShops
{
    FMResultSet *set = [self.db executeQuery:@"SELECT * FROM t_shop LIMIT 10,10;"];
    while (set.next) {
        NSData *data = [set objectForColumnName:@"shop"];
        HMShop *shop = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSLog(@"%@", shop);
    }
//    NSMutableArray *shops = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/apple/Desktop/shops.data"];
//    NSLog(@"%@", [shops subarrayWithRange:NSMakeRange(20, 10)]);
}

- (void)addShops
{
//    NSMutableArray *shops = [NSMutableArray array];
//    for (int i = 0; i<1000; i++) {
//        HMShop *shop = [[HMShop alloc] init];
//        shop.name = [NSString stringWithFormat:@"商品--%d", i];
//        shop.price = arc4random() % 10000;
//        [shops addObject:shop];
//    }
//    [NSKeyedArchiver archiveRootObject:shops toFile:@"/Users/apple/Desktop/shops.data"];
    for (int i = 0; i<100; i++) {
        HMShop *shop = [[HMShop alloc] init];
        shop.name = [NSString stringWithFormat:@"商品--%d", i];
        shop.price = arc4random() % 10000;
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:shop];
        [self.db executeUpdateWithFormat:@"INSERT INTO t_shop(shop) VALUES (%@);", data];
    }
}

@end
