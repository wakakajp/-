//
//  RotateView.m
//  InfiniteRotate
//
//  Created by 哇咔咔 on 16/7/22.
//  Copyright © 2016年 jp. All rights reserved.
//

#import "RotateView.h"
#import "RotateFlowLayout.h"
#import "RotateCell.h"
#import "Masonry.h"
#define KSeed 1000

static NSString *cellID = @"rotate";
@interface RotateView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak,nonatomic) UIPageControl *pageControl;
@property (weak,nonatomic) UICollectionView *collectionView;
@property (weak,nonatomic) NSTimer *timer;
@end
@implementation RotateView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    //创建一个collectionView
    RotateFlowLayout *rotateFlowLayout = [[RotateFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:rotateFlowLayout];
    
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [self addSubview:collectionView];
    _collectionView = collectionView;
    
    //创建一个分页控制器
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
//    pageControl.numberOfPages = _rotatePictures.count;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [collectionView addSubview:pageControl];
    _pageControl = pageControl;
    //设置分页指示器的约束
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(10);
    }];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    //注册cell
    [collectionView registerClass:[RotateCell class] forCellWithReuseIdentifier:cellID];
    
    //创建一个定时器
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:2];
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:date interval:0.1 target:self selector:@selector(playPicture) userInfo:nil repeats:YES];
    _timer = timer;
    //将定时器加入时间循环中,共存模式
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)playPicture {
    CGPoint offset = _collectionView.contentOffset;
    offset.x += self.frame.size.width;
    [_collectionView setContentOffset:offset animated:YES];
}
//重写set方法来设置pageControl的页数
- (void)setRotatePictures:(NSArray *)rotatePictures {
    _rotatePictures = rotatePictures;
    _pageControl.numberOfPages = _rotatePictures.count;
}
#pragma mark - collectionView的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _rotatePictures.count * KSeed;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RotateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.picture = _rotatePictures[indexPath.item % _rotatePictures.count];
    return cell;
}
#pragma mark - collectionView的代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _timer.fireDate = [NSDate distantFuture];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _timer.fireDate = [[NSDate alloc] initWithTimeIntervalSinceNow:2];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //计算pageControl的当前页码
    CGPoint offset = scrollView.contentOffset;
    CGFloat currentPage = offset.x / self.frame.size.width + 0.5;
    _pageControl.currentPage = (NSInteger)currentPage % _rotatePictures.count;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //得到当前cell的indexPath
    UICollectionViewCell *cell = [_collectionView.visibleCells firstObject];
    NSIndexPath *indexPath = [_collectionView indexPathForCell:cell];
    NSInteger itemCount = [_collectionView numberOfItemsInSection:0];
    //如果滑动到最后一个cell,就让collectionView跳转到itemCount / 2 - 1的位置(应注意item / 2 必须是图片个数的倍数)
    if (indexPath.item == itemCount - 1) {
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:itemCount / 2 - 1 inSection:0];
        [_collectionView scrollToItemAtIndexPath:toIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    //如果滑动到
    if (indexPath.item == 0) {
        NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:itemCount / 2 inSection:0];
        [_collectionView scrollToItemAtIndexPath:toIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}
//scorllToItemAtIndexPath这个方法在自动布局的时候不能写在viewDidLoad里面
- (void)layoutSubviews {
    //调用这个方法必须先调用父类方法
    [super layoutSubviews];
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:_rotatePictures.count * KSeed / 2 inSection:0];
    [_collectionView scrollToItemAtIndexPath:toIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}
- (void)removeFromSuperview {
    [super removeFromSuperview];
    //当rotateView从父控件移除时,这个时候timer就没有了存在的意义,这个时候要停掉定时器,也就是将它从时间循环中移除
    [_timer invalidate];
}
@end
