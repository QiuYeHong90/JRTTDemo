//
//  CDViewController.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

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
    Data* obj = self.dataArray[indexPath.row];
    
    NSString * CellInentifer = @"ImgLeftTableViewCell";
    if ([obj hasImage_list]) {
        NSInteger count = [obj.model[@"image_list"] count];
        if (count==3) {
            CellInentifer = @"ImgBottomTableViewCell";
        }
        if (count==1) {
            CellInentifer = @"ImgBottomOneTableViewCell";
        }
        
    }else{
        CellInentifer = @"ImgLeftTableViewCell";
    }
    
    
    TWTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellInentifer];
    
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:CellInentifer owner:self options:nil][0];
    }
    
    [cell setArr:self.dataArray indexPath:indexPath];
    
    return cell;
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


@end
