//
//  SmallVideoViewController.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "BaseChirldViewController.h"

@interface SmallVideoViewController : BaseChirldViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) UIImageView * curretnImageView;

@end
