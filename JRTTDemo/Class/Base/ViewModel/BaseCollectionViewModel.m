//
//  BaseCollectionViewModel.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "BaseCollectionViewModel.h"

@interface BaseCollectionViewModel()

@end

@implementation BaseCollectionViewModel
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
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self registerCell];
    
    self.dataArray = datayArray;
    self.callBlock = didSelectedBlock;
    
    
}
-(void)registerCell
{
    [self.collectionView registerNib:[UINib nibWithNibName:self.cellIdentifer bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:self.cellIdentifer];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    
    NSInteger count = self.dataArray.count;
    return count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    UICollectionViewCell <ReactiveView>* cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifer forIndexPath:indexPath];
    [cell bindData:self.dataArray indexPath:indexPath];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.callBlock) {
        self.callBlock(indexPath, self.dataArray);
    }
}
-(void)updateData:(NSMutableArray *)dataArray
{
    self.dataArray = dataArray;
    [self.collectionView reloadData];
}
@end
