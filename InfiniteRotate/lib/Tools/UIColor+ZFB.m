//
//  UIColor+ZFB.m
//  01-生活圈
//
//  Created by HM on 16/7/11.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UIColor+ZFB.h"

@implementation UIColor (ZFB)
+ (instancetype)hm_colorWithHex:(int32_t)hex alpha:(CGFloat)alpha{
    //hex = 0xA3 B2 FF
    int red = hex & 0xFF0000 >> 16;
    int green = hex & 0x00FF00 >> 8;
    int blue = hex & 0x0000FF;
    
    UIColor *color = [UIColor hm_colorWithR:red G:green B:blue alpha:alpha];
    return color;
}
+ (instancetype)hm_colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
+ (instancetype)hm_randomColor{
    return [UIColor hm_colorWithR:arc4random_uniform(256) G:arc4random_uniform(256) B:arc4random_uniform(256) alpha:1];
}
@end
