//
//  PlayBackCollectionViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/7.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import "DataModel.h"
#import "PlayBackCollectionViewCell.h"

@implementation PlayBackCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)bindData:(id)data indexPath:(NSIndexPath *)indexPath
{
    Data * dict = data[indexPath.row];
    
    NSString * title = dict.model[@"raw_data"][@"title"];
    
    NSInteger digg_count = [dict.model[@"raw_data"][@"action"][@"digg_count"] integerValue];
    
    
    
    NSDictionary * user = dict.model[@"raw_data"][@"user"];
    NSString * avatar_url = user[@"info"][@"avatar_url"];
    NSString * name = user[@"info"][@"name"];
    
    
    NSArray * large_image_list = dict.model[@"raw_data"][@"large_image_list"];
    NSString * url = @"";
    if (large_image_list) {
        url = large_image_list[0][@"url"];
        url = [self imgUrl:url];
    }
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    
}

-(NSString *)imgUrl:(NSString *)url
{
    if ([url hasSuffix:@".webp"]) {
        url = [url stringByReplacingOccurrencesOfString:@".webp" withString:@".png"];
    }
    
    return url;
}
@end
