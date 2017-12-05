//
//  BidirectionalCollectionLayout.m
//  iCrew
//
//  Created by Eiichi Hayashi on 2017/12/05.
//  Copyright © 2017年 Eiichi Hayashi. All rights reserved.
//

#import "BidirectionalCollectionLayout.h"

@implementation BidirectionalCollectionLayout {
    NSInteger cellCount;
    CGSize cellSize;
}

- (void)prepareLayout
{
    [super prepareLayout];
    cellCount = [self.collectionView numberOfItemsInSection:0];
    cellSize = CGSizeMake(2000.0f, 66.0f);
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(cellSize.width, cellCount * cellSize.height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *indexPathsArray = [self indexPathsForItemsInRect:rect];
    NSMutableArray *array = [NSMutableArray array];
    for (NSIndexPath *indexPath in indexPathsArray) {
        [array addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return array;
}

- (NSArray *)indexPathsForItemsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger minRow = MAX(0, (NSInteger)floor(rect.origin.y / cellSize.height));
    NSInteger maxRow = MIN(cellCount, (NSInteger)ceil((rect.origin.y + rect.size.height) / cellSize.height));
    for (NSInteger i = minRow; i < maxRow; i++) {
        [array addObject:[NSIndexPath indexPathForItem:i inSection:0]];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat offsetY = indexPath.item * cellSize.height;
    CGRect frame = CGRectMake(0, offsetY, cellSize.width, cellSize.height);
    attributes.frame = frame;
    return attributes;
}

@end
