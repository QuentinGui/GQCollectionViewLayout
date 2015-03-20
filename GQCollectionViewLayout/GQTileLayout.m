//
//  GQTileLayout.m
//  UICollectionViewReview
//
//  Created by Katsura on 3/20/15.
//  Copyright (c) 2015 Katsura. All rights reserved.
//

#import "GQTileLayout.h"

#define GQRandom (arc4random_uniform(100)/100.0)


@implementation GQTileLayout


/**
 *  实现刷新
 *
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}



/**
 *  遍历 item的属性,固定调用
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
}

/**
 *  继承基本的layout必须实现的方法
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *angles = @[@0, @(-0.2), @(-0.5), @(0.2), @(0.5)];
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(100, 100);
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    if (indexPath.item >= 5) {
        attrs.hidden = YES;
    } else {
        attrs.transform = CGAffineTransformMakeRotation([angles[indexPath.item] floatValue]);
        // zIndex越大,就越在上面
        attrs.zIndex = [self.collectionView numberOfItemsInSection:indexPath.section] - indexPath.item;
    }
    return attrs;
}

/**
 *  不想滚动,则不用此方法
 */
//- (CGSize)collectionViewContentSize
//{
//    return CGSizeMake(500, 500);
//}





@end
