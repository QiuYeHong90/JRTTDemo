//
//  ImgBottomTableViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "ImgBottomTableViewCell.h"

@implementation ImgBottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath

{
    [super setArr:arr indexPath:indexPath];
    Data * dict = arr[indexPath.row];
    
    NSString * url0 = dict.model[@"image_list"][0][@"url"];
    NSString * url1 = dict.model[@"image_list"][1][@"url"];
    NSString * url2 = dict.model[@"image_list"][2][@"url"];
    
    url0 = [self imgUrl:url0];
    url1 = [self imgUrl:url1];
    url2 = [self imgUrl:url2];
    
    [self.imgView0 sd_setImageWithURL:[NSURL URLWithString:url0] placeholderImage:nil];
    [self.imgView1 sd_setImageWithURL:[NSURL URLWithString:url1] placeholderImage:nil];
    [self.imgView2 sd_setImageWithURL:[NSURL URLWithString:url2] placeholderImage:nil];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
