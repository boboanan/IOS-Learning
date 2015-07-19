//
//  HMShopTool.h
//  02-FMDB(掌握)
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HMShop;

@interface HMShopTool : NSObject
+ (NSArray *)shops;
+ (void)addShop:(HMShop *)shop;
@end
