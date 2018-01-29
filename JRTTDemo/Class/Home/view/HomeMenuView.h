//
//  HomeMenuView.h
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CollectionViewModel.h"


@interface HomeMenuView : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) CollectionViewModel * viewModel;

+(instancetype)getViewWithNibSelectedBlock:(didSelectedBlock)SelectedBlock;


-(void)clickIdx:(NSInteger)idx;

@end
