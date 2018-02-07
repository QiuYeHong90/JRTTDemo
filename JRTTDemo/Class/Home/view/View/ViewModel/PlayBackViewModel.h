//
//  PlayBackViewModel.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/7.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "BaseCollectionViewModel.h"

@interface PlayBackViewModel : BaseCollectionViewModel

@property (nonatomic,strong) UICollectionViewCell * currentCell;
@property (nonatomic,assign) BOOL isFirst;
@property (nonatomic,assign) NSInteger fromIdx;
@end
