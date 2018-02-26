//
//  BaseCollectionViewModel.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import "ReactiveView.h"
#import <Foundation/Foundation.h>
typedef void(^didSelectedBlock)(NSIndexPath *idxPath,NSMutableArray *dataArray);
@interface BaseCollectionViewModel : NSObject<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,copy) NSString * cellIdentifer;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) didSelectedBlock callBlock;

-(void)setCollectionView:(UICollectionView *)collectionView
              datayArray:(NSMutableArray *)datayArray
           cellIdentifer:(NSString *)cellIdentifer
        didSelectedBlock:(didSelectedBlock)didSelectedBlock;

-(void)registerCell;

-(void)updateData:(NSMutableArray *)dataArray;
@end
