//
//  CDViewController.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "DetailZBViewController.h"
#import "TWTableViewCell.h"


#import "CDViewController.h"

@interface CDViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _y;
}
@property (nonatomic,strong) DataModel * sorceModel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation CDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(UIScrollView * )getScrollViewAddRefreshAndFooter
{
    return self.tableView;
}
-(void)updateUI
{
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSString * CellInentifer = @"ImgLeftTableViewCell";
    NSInteger flag = [[self class] JudgeNumWithDataArr:self.dataArray IndexPath:indexPath];
    
    switch (flag) {
        case 0:
        {
            CellInentifer = @"ImgLeftTableViewCell";
        }
            break;
        case 1:
        {
            CellInentifer = @"ImgBottomTableViewCell";
        }
            break;
        case 2:
        {
            CellInentifer = @"ImgBottomOneTableViewCell";
        }
            break;
        case 3:
        {
            CellInentifer = @"ZhiBoTableViewCell";
        }
            break;
            
        default:
        {
            CellInentifer = @"ImgLeftTableViewCell";
        }
            break;
    }
    
    
    TWTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellInentifer];
    
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:CellInentifer owner:self options:nil][0];
    }
    
    [cell setArr:self.dataArray indexPath:indexPath];
    
    return cell;
}

/**
 判断是什么类型的

 @param dataArray 数组
 @param indexPath 索引
 @return 0 左边文字右边图片  1 下边三张图片 2下面一张图片 3 直播
 */
+(NSInteger)JudgeNumWithDataArr:(NSMutableArray *)dataArray IndexPath:(NSIndexPath *)indexPath
{
    Data* obj = dataArray[indexPath.row];
    
    
    if ([obj hasImage_list]) {
        NSInteger count = [obj.model[@"image_list"] count];
        if (count==3) {
            return 1;
        }
        if (count==1) {
            return 2;
        }
        
    }else{
        
        
        if (obj.model[@"background"][@"video"][@"covers"]) {
            return 3;
        }else{
            return 0;
        }
    }
    
    return 0;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Data* obj = self.dataArray[indexPath.row];
    return  [obj.cellHeight floatValue];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat agoY = _y;
    CGFloat nowY = scrollView.contentOffset.y;
    
    if (nowY - agoY >0) {
//        向上
        
    }else{
//        乡下
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger flag = [[self class] JudgeNumWithDataArr:self.dataArray IndexPath:indexPath];
    Data* obj = self.dataArray[indexPath.row];
    
    switch (flag) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
//            直播
            DetailZBViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailZBViewController"];
            vc.live_id = obj.model[@"live_id"];
            
            self.navigationController.hidesBottomBarWhenPushed = YES;
            self.navigationController.navigationBarHidden = YES;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
        {
            
        }
            break;
    }
    
    
    

}




@end
