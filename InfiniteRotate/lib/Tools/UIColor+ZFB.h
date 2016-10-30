//
//  UIColor+ZFB.h
//  01-生活圈
//
//  Created by HM on 16/7/11.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZFB)
+ (instancetype)hm_colorWithHex:(int32_t)hex alpha:(CGFloat)alpha;
+ (instancetype)hm_colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha;
+ (instancetype)hm_randomColor;
@end
