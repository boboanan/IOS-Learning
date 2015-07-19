//
//  main.m
//  const的使用
//
//  Created by apple on 14-10-25.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "Const.h"
#import <Foundation/Foundation.h>

const int HWAge = 200;
//#define HWAge 20

void testPointer();
void test(const int *p);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSLog(@"%@", HWAppKey);
        NSLog(@"%@", HWRedirectURI);
        NSLog(@"%@", HWMyAge);
        
//        NSString *name1 = HWAppKey;
//        NSString *name2 = HWAppKey;
    
//        NSLog(@"%d", HWAge);
//        NSLog(@"%d", HWAge);
//        NSLog(@"%d", HWAge);
//        NSLog(@"%d", HWAge);
//        NSLog(@"%d", HWAge);
        
//        NSString  * const name = @"Jack";
//        NSLog(@"%@", name);
        
//        int a = 10;
//        
//        test(&a);
    }
    return 0;
}

void test(const int *p) {
    NSLog(@"%d", *p);
}

void testConst2()
{
    int age = 20;
    
    // const的修饰的*p1和*p2，*p1和*p2是常量，不能通过p1、p2指针间接修改其他变量的值
    const int *p1 = &age;
    int const *p2 = &age;
    
    int num = 30;
    p1 = &num;
    p2 = &num;
    
    //        *p1 = 40;
    //        *p2 = 50;
    
    // const修饰的p3，p3是个常量，p3不能再指向其他变量
    int * const p3 = &age;
    
    // 写法错误
    //        int num = 30;
    //        p3 = &num;
    
    // 写法正确
    //        *p3 = 30;
}

void testPointer()
{
    // int类型的变量（整型变量）
    int age = 20;
    
    // 指针变量：指向int类型的变量，作用是存储地址
    int *p = &age;
    *p = 30;
    
    int num = 100;
    p = &num;
    *p = 40;
    
    NSLog(@"%d %d", age, num);
}

void testConst()
{
    // age1\age2是常量，只读
    const int age1 = 20;
    int const age2 = 30;
    
//    age2 = 100;
//    age1 = 200;
}

