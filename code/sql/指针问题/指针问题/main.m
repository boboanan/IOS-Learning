//
//  main.m
//  指针问题
//
//  Created by apple on 14/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a[2][3] = {{10, 20, 30}, {100, 200, 300}};
        int *p = (int *)(a + 1);
        NSLog(@"%d", *(p - 2));
        
        a[0]; // a[0][0]的地址,指向a[0][0]元素的指针,指向4个字节的空间
        a[1]; // a[1][0]的地址,指向a[1][0]元素的指针,指向4个字节的空间
        a; // a[0]的地址,指向a[0]的指针,指向12个字节的空间
        &a; // a的地址,指向a的指针,指向24个字节的空间
        
        // 二维数组
//        int array[4] = {10, 20, 30, 40};
//        double *p = (double *)(&array + 1);
//        NSLog(@"%d", *(int *)(p - 1));
        
//        int *p1 = array; // 指向首元素的指针,指向4个字节的空间
//        int (*p2)[4] = &array; // 指向数组的指针,指向16个空间
        
        
//        NSLog(@"%p %p", array + 1, &array + 1);
        
//        int *p = array;
        // array == &array[0]
        // 数组名 == 首元素的地址 == 认为是指向首元素的指针
        
//        int *p = &array[3];
//        NSLog(@"%d", *(p - 2));
        
        // p : 存储的是第0个元素的值10
        //
        
//        NSLog(@"%d", *p);
        
//        for (int i = 0; i<4; i++) {
//            NSLog(@"%d", *(p + i));
//        }
    }
    return 0;
}
