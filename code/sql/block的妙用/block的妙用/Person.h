//
//  Person.h
//  block的妙用
//
//  Created by apple on 14/11/20.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//- (Person *)study;
//- (Person *)run;

- (Person *(^)(NSString *name))study;
- (Person *(^)())run;
@end
