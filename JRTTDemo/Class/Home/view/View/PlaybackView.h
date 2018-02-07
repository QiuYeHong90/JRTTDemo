//
//  PlaybackView.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/7.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "PlayBackViewModel.h"
#import "BaseCollectionViewModel.h"
#import <UIKit/UIKit.h>





@interface PlaybackView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,assign) NSInteger fromIdx;
@property (nonatomic,strong) PlayBackViewModel * viewModel;
@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic,strong) AVPlayerLayer *Avlayer;
@property (nonatomic,weak) UICollectionViewCell * currentCell;

@property (nonatomic,copy) NSString * urlVideo;
+(void)showData:(NSMutableArray *)data fromIdx:(NSInteger)fromIdx;



@end



