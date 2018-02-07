//
//  PlaybackView.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/7.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import "DataModel.h"
#import "PlaybackView.h"

@implementation PlaybackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(void)showData:(NSMutableArray *)data fromIdx:(NSInteger)fromIdx closeBlock:(void (^)(UIImage *img,NSIndexPath *indexPath))CallBlcok
{
    UIWindow * kewindow = [UIApplication sharedApplication].keyWindow;
    
    PlaybackView * view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
    view.CallBlcok= CallBlcok;
    view.fromIdx = fromIdx;
    view.viewModel.fromIdx = fromIdx;
    [view loadUI];
    [view updateData:data];
    
    
    view.frame = kewindow.bounds;
    [kewindow addSubview:view];
    
    
//    NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:view.fromIdx inSection:0];
//    [view playIdxPath:newIndexPath dataArray:data];
    
}
-(PlayBackViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [PlayBackViewModel new];
    }
    return _viewModel;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    
}

-(void)loadUI
{
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.flowLayout.minimumLineSpacing = 0.000000000001;
    self.flowLayout.minimumInteritemSpacing = 1;
    self.flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.collectionView.pagingEnabled = YES;
    __weak typeof(self) weakSelf = self;
    [self.viewModel setCollectionView:self.collectionView datayArray:@[].mutableCopy cellIdentifer:@"PlayBackCollectionViewCell" didSelectedBlock:^(NSIndexPath *idxPath, NSMutableArray *dataArray) {
        
        [weakSelf playIdxPath:idxPath dataArray:dataArray];
    }];
    
    
    
}

-(void)playIdxPath:(NSIndexPath *)idxPath dataArray:(NSMutableArray *)dataArray
{
    
    self.currentIndexPath = idxPath;
    self.currentCell = (PlayBackCollectionViewCell *)self.viewModel.currentCell;
    Data * dict = dataArray[idxPath.row];
    
    NSArray * listVideo = dict.model[@"raw_data"][@"video"][@"play_addr"][@"url_list"];
    if (listVideo) {
        if (listVideo.count>0) {
            NSLog(@"listVideo====%@",listVideo[0]);
            self.urlVideo = listVideo[0];
            
            [self.player play];
            
                        [self removeNotification];
                        [self addNotification];
        }
        
        
    }
}


-(void)updateData:(NSMutableArray *)data
{

    [self.viewModel updateData:data];
}




- (IBAction)close:(id)sender {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeFromSuperview];
    
    if (self.CallBlcok) {
        self.CallBlcok(self.currentCell.image.image, self.currentIndexPath);
    }

}


#pragma mark - 懒加载代码
-(AVPlayer *)player
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
        layer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        self.Avlayer.backgroundColor = [UIColor redColor].CGColor;
        self.Avlayer = layer;
    self.Avlayer.videoGravity=AVLayerVideoGravityResizeAspectFill;//视频填充模式
        [self.currentCell.layer addSublayer:self.Avlayer];
       
        
        
    }else{
        if ([self.Avlayer.superlayer isEqual:self.currentCell.layer]) {
            
        }else{
            // 2.创建AVPlayerItem
            AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
            _player = [AVPlayer playerWithPlayerItem:item];
            self.Avlayer.player = _player;
            [self.Avlayer removeFromSuperlayer];
            [self.currentCell.layer addSublayer:self.Avlayer];

        }
        
        
    }
    
    
    return _player;
}


/**
 *  添加播放器通知
 */
-(void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  播放完成通知
 *
 *  @param notification 通知对象
 */
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    
    
    // 播放完成后重复播放
    // 跳到最新的时间点开始播放
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}


@end
