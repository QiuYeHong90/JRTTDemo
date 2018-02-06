//
//  TWTableViewCell.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import "DataModel.h"
#import <UIKit/UIKit.h>

@interface TWTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
-(void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath;

-(NSString *)imgUrl:(NSString *)url;
@end
