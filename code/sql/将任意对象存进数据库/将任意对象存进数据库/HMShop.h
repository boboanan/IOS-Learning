//
//  HMShop.h
//  将任意对象存进数据库
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMShop : NSObject <NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) double  price;
@end
