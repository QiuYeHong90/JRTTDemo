//
//  ImgLeftTableViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "ImgLeftTableViewCell.h"

@implementation ImgLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath
{
    Data * dict = arr[indexPath.row];
    
    
    
    self.leftImg_H.constant = [dict middle_image_H];
    self.leftImg_W.constant = [dict middle_image_W];
    self.Img_margin_Right.constant = [dict middle_image_MarginR];
    
    self.titleLab.text = dict.model[@"title"];
    NSString * url = dict.model[@"middle_image"][@"url"];
    url = [self imgUrl:url];
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    
    if (dict.RightX124) {
        self.rightX.constant = 124+10+10;
    }else{
        self.rightX.constant = 10;
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
