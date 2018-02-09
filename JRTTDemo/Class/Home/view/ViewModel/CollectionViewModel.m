//
//  CollectionViewModel.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "CollectionViewModel.h"

@interface CollectionViewModel()



@property (nonatomic,assign) NSInteger selectedIdx;
@end

@implementation CollectionViewModel




- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    UICollectionViewCell * cell  = [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    cell.selected  = self.selectedIdx == indexPath.row;
    return cell;
}

-(void)updateData:(NSMutableArray *)dataArray
{
    [self.dataArray setArray: dataArray];
    [self.collectionView reloadData];
}


-(void)clickIdx:(NSInteger)idx
{
    self.selectedIdx = idx;
    NSIndexPath * idxPath = [NSIndexPath indexPathForRow:idx inSection:0];
    [self.collectionView scrollToItemAtIndexPath:idxPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self.collectionView reloadData];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.callBlock) {
        self.selectedIdx = indexPath.row;
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        [collectionView reloadData];
        self.callBlock(indexPath, self.dataArray);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    T1Data * str = self.dataArray[indexPath.row];
//    CGFloat w = [str.name widthForFont:[UIFont systemFontOfSize:15]];
    return CGSizeMake(10, 30);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0001;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 40);
}



@end
