//
//  ViewController.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "HomeMenuCollectionViewCell.h"
#import "HomeMenuView.h"
#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *MenuBottomView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic,strong) HomeMenuView * menuView;

@property (nonatomic,assign) NSInteger selectedIdx;


@property (nonatomic,assign) BOOL isShou;
@end

@implementation ViewController
-(HomeMenuView *)menuView
{
    if(!_menuView){
        __weak typeof(self) weakSelf = self;
        _menuView = [HomeMenuView getViewWithNibSelectedBlock:^(NSIndexPath *idxPath, NSMutableArray *dataArray) {
            weakSelf.isShou = NO;
            weakSelf.selectedIdx = idxPath.row;
            [weakSelf changeVC:idxPath.row];
        }];
    }
    
    return _menuView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray * tempArray = @[@"推荐",@"重庆",@"视频",@"新时代",@"图片",@"问答",@"娱乐",@"科技",@"懂车帝",@"财经",@"军事",@"体育",@"段子",@"街拍",].mutableCopy;
    [self.MenuBottomView addSubview:self.menuView];
    
    __weak typeof(self) weakSelf = self;
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.MenuBottomView);
        make.left.equalTo(weakSelf.MenuBottomView);
        make.right.equalTo(weakSelf.MenuBottomView);
        make.bottom.equalTo(weakSelf.MenuBottomView).offset(-1);
    }];
    [self.menuView.viewModel updateData:tempArray];
//    跟视图控制器
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    for (NSString * dd in tempArray) {
        UIViewController * vc  = [self.storyboard instantiateViewControllerWithIdentifier:@"CDViewController"];
        vc.title = dd;
        
        [self addChildViewController:vc];
        
    }
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*tempArray.count, self.scrollView.height);
    [self changeVC:0];
    
    
}

-(void)changeVC:(NSInteger)idx
{
    CGFloat left = idx*SCREEN_WIDTH;
     [self.scrollView setContentOffset:CGPointMake(left, 0) animated:YES];
    
    [self addVC:idx];
}
-(void)addVC:(NSInteger)idx
{
    CGFloat left = idx*SCREEN_WIDTH;
    
    UIViewController * vc =  self.childViewControllers[idx];
    if (vc.view.superview) {
        return;
    }
    
    [self.scrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(left, 0, SCREEN_WIDTH, self.scrollView.height);
    
    vc.view.backgroundColor = [UIColor colorWithWholeRed:arc4random()%255 green:arc4random()%255 blue:arc4random()%255];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.isShou = YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.isShou) {
        return;
        
    }
//    scrollView
    
    CGFloat idx = scrollView.contentOffset.x/SCREEN_WIDTH;
    
    
    
    if (idx-self.selectedIdx>0&&idx-self.selectedIdx<1) {
        if (idx+1<=self.childViewControllers.count) {
            [self addVC:idx+1];
             CGFloat d =fabsf(idx-self.selectedIdx) ;
            NSLog(@"====%f",d);
            HomeMenuCollectionViewCell * cell1 = [self getCellWithIdex:self.selectedIdx+1];
            HomeMenuCollectionViewCell * cell = [self getCellWithIdex:self.selectedIdx];

            [self fromCell:cell toCell1:cell1 d:d];
            
        }
        
    }else if (idx-self.selectedIdx<=0&&idx-self.selectedIdx>=-1){
        if (idx>=0) {
            [self addVC:idx];
            HomeMenuCollectionViewCell * cell1 = [self getCellWithIdex:self.selectedIdx-1];
            HomeMenuCollectionViewCell * cell = [self getCellWithIdex:self.selectedIdx];
            CGFloat d =fabsf(idx-self.selectedIdx) ;
            [self fromCell:cell toCell1:cell1 d:d];
        }
        
    }
    
    
    
    
}

-(void)fromCell:(HomeMenuCollectionViewCell*)cell toCell1:(HomeMenuCollectionViewCell*)cell1 d:(CGFloat)d
{
    
    cell.title.font = [UIFont systemFontOfSize:16-d];
    cell.title.textColor = RGB(249-d*(249-34),118-(118-34)*d,118-(118-34)*d);
    cell1.title.font = [UIFont systemFontOfSize:15+d];
    cell1.title.textColor = RGB(34+d*(249-34),34+(118-34)*d,34+(118-34)*d);
}


-(HomeMenuCollectionViewCell*)getCellWithIdex:(NSInteger)idx
{
    NSIndexPath * idxPath = [NSIndexPath indexPathForRow:idx inSection:0];
    HomeMenuCollectionViewCell * cell = (HomeMenuCollectionViewCell *)[self.menuView.collectionView cellForItemAtIndexPath:idxPath];
    return cell;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger idx = scrollView.contentOffset.x/SCREEN_WIDTH;
    
//    HomeMenuCollectionViewCell * cell1 = [self getCellWithIdex:self.selectedIdx];
//    cell1.selected = NO;
    
    self.selectedIdx = idx;
    [self.menuView clickIdx:idx];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
