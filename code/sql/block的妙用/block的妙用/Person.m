//
//  Person.m
//  block的妙用
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "Person.h"

@implementation Person
//- (Person *)study
//{
//    NSLog(@"study----");
//    
//    return self;
//}
//
//- (Person *)run
//{
//    NSLog(@"run----");
//    return self;
//}

- (Person *(^)(NSString *))study
{
    return ^(NSString *name){
        NSLog(@"study----%@", name);
        return self;
    };
}

- (Person *(^)())run
{
    return ^{
        NSLog(@"run----");
        return self;
    };
}
@end
