//
//  SmallVideoViewController.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//


#import "SmalVideoCollectionViewCell.h"
#import "PlaybackView.h"
#import <AVFoundation/AVFoundation.h>
#import "SmallVideoViewModel.h"
#import "SmallVideoViewController.h"

@interface SmallVideoViewController ()
@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic,copy) NSString * urlVideo;
@property (nonatomic,strong) SmallVideoViewModel * viewModel;
@end

@implementation SmallVideoViewController

-(UIImageView *)curretnImageView
{
    if (!_curretnImageView) {
        _curretnImageView = [UIImageView new];
        
        _curretnImageView.contentMode = UIViewContentModeScaleAspectFill;
       UIWindow * window  = [UIApplication sharedApplication].keyWindow;
        _curretnImageView.hidden = YES;
        [window addSubview:_curretnImageView];
    }
    return _curretnImageView;
}

-(SmallVideoViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [SmallVideoViewModel new];
    }
        return _viewModel;
}

#pragma mark - 懒加载代码
- (AVPlayer *)player
{
    NSURL *url = [NSURL URLWithString:self.urlVideo];
    if (_player == nil) {
        // 1.获取URL(远程/本地)
        // NSURL *url = [[NSBundle mainBundle] URLForResource:@"01-知识回顾.mp4" withExtension:nil];
        
        
        // 2.创建AVPlayerItem
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        
        // 3.创建AVPlayer
        _player = [AVPlayer playerWithPlayerItem:item];
        
        // 4.添加AVPlayerLayer
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
        [self.view.layer addSublayer:layer];
    }else{
        // 2.创建AVPlayerItem
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        [_player replaceCurrentItemWithPlayerItem:item];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSInteger coll = 2;
    CGFloat itemSpace = 2;
    CGFloat itemW = (SCREEN_WIDTH - itemSpace*(coll-1))/coll;
    CGFloat itemH = itemW *1.5;
    self.flowLayout.minimumLineSpacing = itemSpace;
    self.flowLayout.minimumInteritemSpacing = itemSpace;
    self.flowLayout.itemSize = CGSizeMake(itemW, itemH);
    
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel setCollectionView:self.collectionView datayArray:self.dataArray cellIdentifer:@"SmalVideoCollectionViewCell" didSelectedBlock:^(NSIndexPath *idxPath, NSMutableArray *dataArray) {
        
        
        [weakSelf showImgViewAnimationIndexPath:idxPath isOpen:YES];
        
        
    }];
}

-(void)showImgViewAnimationIndexPath:(NSIndexPath *)indexPath isOpen:(BOOL)isOpen
{
    
     SmalVideoCollectionViewCell * cell = (SmalVideoCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
    
    cell = (SmalVideoCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    UIWindow * w = [UIApplication sharedApplication].keyWindow;
    CGRect rect   = [self.collectionView convertRect:cell.frame toView:w];
    self.curretnImageView.image = cell.bgImageView.image;
    self.curretnImageView.frame = isOpen==YES? rect:w.bounds;
    self.curretnImageView.hidden = NO;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        self.curretnImageView.frame = isOpen==YES? w.bounds:rect;
    } completion:^(BOOL finished) {
        
        if (isOpen) {
            [PlaybackView showData:self.dataArray fromIdx:indexPath.row closeBlock:^(BOOL isClose, NSIndexPath *indexPath) {
                if (isClose) {
                    [weakSelf showImgViewAnimationIndexPath:indexPath isOpen:NO];
                }else{
                    [weakSelf.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
                }
                
            }] ;
        }
        
        weakSelf.curretnImageView.hidden = YES;
    }];

    
    
}

-(UIScrollView * )getScrollViewAddRefreshAndFooter
{
    return self.collectionView;
}
-(void)updateUI
{
    [self.viewModel updateData:self.dataArray];
    
    [PlaybackView updateData:self.dataArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
