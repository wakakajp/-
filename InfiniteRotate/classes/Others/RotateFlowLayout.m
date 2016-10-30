//
//  RotateFlowLayout.m
//  InfiniteRotate
//
//  Created by 哇咔咔 on 16/7/22.
//  Copyright © 2016年 jp. All rights reserved.
//

#import "RotateFlowLayout.h"

@implementation RotateFlowLayout
- (void)prepareLayout {
    self.itemSize = self.collectionView.frame.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;
}
@end
