//
//  UIColor+CZ.m
//  01-生活圈
//
//  Created by Chris on 16/6/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIColor+CZAddition.h"

@implementation UIColor (CZAddition)
+ (instancetype)cz_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha{
    int red = (hex & 0xFF0000) >> 16;
    int green = (hex & 0x00FF00) >> 8;
    int blue = (hex & 0x0000FF);
    
    return [UIColor cz_colorWithR:red G:green B:blue alpha:alpha];
}
+ (instancetype)cz_colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

@end
