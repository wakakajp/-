//
//  ViewController.m
//  InfiniteRotate
//
//  Created by 哇咔咔 on 16/7/22.
//  Copyright © 2016年 jp. All rights reserved.
//

#import "ViewController.h"
#import "RotateView.h"
#import "Masonry.h"
#define IMAGECOUNT 5
@interface ViewController ()

@end

@implementation ViewController {
    NSArray<UIImage *> *_rotatePictures;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupUI];
}
- (void)setupUI {
    RotateView *rotateView = [[RotateView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    rotateView.rotatePictures = _rotatePictures;
    [self.view addSubview:rotateView];
    
    [rotateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(120);
    }];
}
- (void)loadData {
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:5];
    
    for (int i = 0; i < IMAGECOUNT; i++) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"Home_Scroll_%02zd.jpg",i+1] withExtension:nil];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        [arrayM addObject:image];
    }
    _rotatePictures = arrayM.copy;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
