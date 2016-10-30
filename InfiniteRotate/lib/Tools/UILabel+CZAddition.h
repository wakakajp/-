//
//  UILabel+CZ.h
//  01-生活圈
//
//  Created by Chris on 16/6/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CZAddition)
+ (instancetype)cz_labelWithText:(NSString *)text Color:(UIColor *)color Font:(CGFloat)fontSize;
@end
