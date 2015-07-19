//
//  HMShop.m
//  将任意对象存进数据库
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMShop.h"

@implementation HMShop
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeDouble:self.price forKey:@"price"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.price = [decoder decodeDoubleForKey:@"price"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ <-> %f", self.name, self.price];
}
@end
