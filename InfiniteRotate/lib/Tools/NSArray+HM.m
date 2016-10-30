//
//  NSArray+HM.m
//  03-支付宝口碑界面
//
//  Created by HM on 16/7/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "NSArray+HM.h"
#import "NSObject+HM.h"
@implementation NSArray (HM)
+ (instancetype)hm_arrayWithURL:(NSURL *)url clasName:(NSString *)className{
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    
    for (NSDictionary *dict in array) {
        NSObject *obj = [NSObject hm_objWithClassName:className dict:dict];
        
        [arrayM addObject:obj];
    }
    return arrayM.copy;
}
@end
