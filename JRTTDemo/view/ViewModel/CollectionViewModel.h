//
//  CollectionViewModel.h
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "ReactiveView.h"
#import <Foundation/Foundation.h>

typedef void(^didSelectedBlock)(NSIndexPath *idxPath,NSMutableArray *dataArray);

@interface CollectionViewModel : NSObject


-(void)setCollectionView:(UICollectionView *)collectionView
              datayArray:(NSMutableArray *)datayArray
           cellIdentifer:(NSString *)cellIdentifer
        didSelectedBlock:(didSelectedBlock)didSelectedBlock;
-(void)clickIdx:(NSInteger)idx;

-(void)updateData:(NSMutableArray *)dataArray;

@end
