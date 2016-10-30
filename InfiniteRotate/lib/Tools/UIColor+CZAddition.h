//
//  UIColor+CZ.h
//  01-生活圈
//
//  Created by Chris on 16/6/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CZAddition)
+ (instancetype)cz_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;
+ (instancetype)cz_colorWithR:(int)red G:(int)green B:(int)blue alpha:(CGFloat)alpha;
@end
