//
//  UILabel+ZFB.m
//  01-生活圈
//
//  Created by HM on 16/7/11.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UILabel+ZFB.h"

@implementation UILabel (ZFB)
+ (instancetype)hm_labelWithText:(NSString *)text color:(UIColor *)color andFont:(CGFloat)font{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}
@end
