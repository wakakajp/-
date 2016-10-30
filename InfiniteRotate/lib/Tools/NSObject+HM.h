//
//  NSObject+HM.h
//  03-支付宝口碑界面
//
//  Created by HM on 16/7/13.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HM)
+ (instancetype)hm_objWithClassName:(NSString *)className dict:(NSDictionary *)dict;
@end
