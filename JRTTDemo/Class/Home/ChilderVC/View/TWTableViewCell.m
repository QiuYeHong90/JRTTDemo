//
//  TWTableViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "TWTableViewCell.h"

@implementation TWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath
{
    Data * dict = arr[indexPath.row];
    
    self.titleLab.text = dict.model[@"title"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSString *)imgUrl:(NSString *)url
{
    if ([url hasSuffix:@".webp"]) {
        url = [url stringByReplacingOccurrencesOfString:@".webp" withString:@".png"];
    }
    
    return url;
}

@end
