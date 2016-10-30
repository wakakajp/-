//
//  RotateCell.m
//  InfiniteRotate
//
//  Created by 哇咔咔 on 16/7/22.
//  Copyright © 2016年 jp. All rights reserved.
//

#import "RotateCell.h"
#import "Masonry.h"
@interface RotateCell ()
@property (weak,nonatomic) UIImageView *imageView;
@end
@implementation RotateCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    _imageView = imageView;
}

- (void)setPicture:(UIImage *)picture {
    _picture = picture;
    
    _imageView.image = picture;
}
@end
