//
//  CollectionViewModel.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "CollectionViewModel.h"

@interface CollectionViewModel()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) UICollectionView * collectionView;
@property (nonatomic,copy) NSString * cellIdentifer;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) didSelectedBlock callBlock;

@property (nonatomic,assign) NSInteger selectedIdx;
@end

@implementation CollectionViewModel

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

-(void)setCollectionView:(UICollectionView *)collectionView
              datayArray:(NSMutableArray *)datayArray
           cellIdentifer:(NSString *)cellIdentifer
        didSelectedBlock:(didSelectedBlock)didSelectedBlock
{
    self.cellIdentifer = cellIdentifer;
    self.collectionView = collectionView;
    [self registerCell];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.dataArray = datayArray;
    self.callBlock = didSelectedBlock;
    
    
}

-(void)registerCell
{
    [self.collectionView registerNib:[UINib nibWithNibName:self.cellIdentifer bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:self.cellIdentifer];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    UICollectionViewCell <ReactiveView>* cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifer forIndexPath:indexPath];
    [cell bindData:self.dataArray indexPath:indexPath];
    cell.selected  = self.selectedIdx == indexPath.row;
    return cell;
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
    NSString * str = self.dataArray[indexPath.row];
    CGFloat w = [str widthForFont:[UIFont systemFontOfSize:15]];
    return CGSizeMake(w+10, 36);
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

-(void)updateData:(NSMutableArray *)dataArray
{
    self.dataArray = dataArray;
    [self.collectionView reloadData];
}

@end
