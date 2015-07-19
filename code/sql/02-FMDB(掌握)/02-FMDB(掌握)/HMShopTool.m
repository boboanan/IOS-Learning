//
//  HMShopTool.m
//  02-FMDB(掌握)
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMShopTool.h"
#import "FMDB.h"
#import "HMShop.h"

@implementation HMShopTool

static FMDatabase *_db;

+ (void)initialize
{
    // 1.打开数据库
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"shops.sqlite"];
    _db = [FMDatabase databaseWithPath:path];
    [_db open];
    
    // 2.创表
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_shop (id integer PRIMARY KEY, name text NOT NULL, price real);"];
}

+ (void)addShop:(HMShop *)shop
{
    [_db executeUpdateWithFormat:@"INSERT INTO t_shop(name, price) VALUES (%@, %f);", shop.name, shop.price];
}

+ (NSArray *)shops
{// 得到结果集
    FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_shop;"];
    
    // 不断往下取数据
    NSMutableArray *shops = [NSMutableArray array];
    while (set.next) {
        // 获得当前所指向的数据
        HMShop *shop = [[HMShop alloc] init];
        shop.name = [set stringForColumn:@"name"];
        shop.price = [set doubleForColumn:@"price"];
        [shops addObject:shop];
    }
    return shops;
}
@end
