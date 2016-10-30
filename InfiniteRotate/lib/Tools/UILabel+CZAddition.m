//
//  UILabel+CZ.m
//  01-生活圈
//
//  Created by Chris on 16/6/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UILabel+CZAddition.h"

@implementation UILabel (CZAddition)
+ (instancetype)cz_labelWithText:(NSString *)text Color:(UIColor *)color Font:(CGFloat)fontSize{
    UILabel *label = [[UILabel alloc]init];
    
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    
    return label;
}
@end
