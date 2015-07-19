//
//  main.m
//  block的妙用
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        
//        [p run];
//        [p study];
//        [[p run] study];
//        [[[[p run] study] run] study];
        
        p.study(@"xx宝典").run().study(@"xx剪发");
    }
    return 0;
}

