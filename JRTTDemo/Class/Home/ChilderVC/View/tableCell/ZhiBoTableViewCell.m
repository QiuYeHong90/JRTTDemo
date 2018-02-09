//
//  ZhiBoTableViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/9.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "ZhiBoTableViewCell.h"

@implementation ZhiBoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath
{
    [super setArr:arr indexPath:indexPath];
    Data * dict = arr[indexPath.row];
    NSString * url0 = dict.model[@"background"][@"video"][@"covers"];
    url0 = [self imgUrl:url0];
    [self.imageView0 sd_setImageWithURL:[NSURL URLWithString:url0] placeholderImage:nil];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
