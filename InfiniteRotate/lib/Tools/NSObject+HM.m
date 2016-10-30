//
//  NSObject+HM.m
//  03-支付宝口碑界面
//
//  Created by HM on 16/7/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "NSObject+HM.h"

@implementation NSObject (HM)
+ (instancetype)hm_objWithClassName:(NSString *)className dict:(NSDictionary *)dict{
    //把传入的字符串转换成一个Class结构体
    Class clz = NSClassFromString(className);
    
    //创建一个对象
    NSObject *obj = [[clz alloc]init];

    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
