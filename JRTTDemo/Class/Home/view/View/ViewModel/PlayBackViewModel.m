//
//  PlayBackViewModel.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/7.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "PlayBackViewModel.h"

@implementation PlayBackViewModel

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.dataArray.count-self.fromIdx;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:indexPath.row+self.fromIdx inSection:indexPath.section];
    
    UICollectionViewCell <ReactiveView>* cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifer forIndexPath:indexPath];
    [cell bindData:self.dataArray indexPath:newIndexPath];
    if (self.isFirst==NO) {
        self.isFirst = YES;
        
        
        if (self.callBlock) {
            self.currentCell = cell;
            self.callBlock(newIndexPath, self.dataArray);
        }
        
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:indexPath.row+self.fromIdx inSection:indexPath.section];
//    if (self.callBlock) {
//        self.callBlock(newIndexPath, self.dataArray);
//    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentR = scrollView.contentOffset.x/SCREEN_WIDTH;
    NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:currentR+self.fromIdx inSection:0];
    NSIndexPath * newIndexPath1 = [NSIndexPath indexPathForRow:currentR inSection:0];
    self.currentCell = [self.collectionView cellForItemAtIndexPath:newIndexPath1];
    if (self.callBlock) {
        
        self.callBlock(newIndexPath, self.dataArray);
    }
}

@end
