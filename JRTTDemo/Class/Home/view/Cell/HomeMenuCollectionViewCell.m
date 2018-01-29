//
//  HomeMenuCollectionViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//



#import "HomeMenuCollectionViewCell.h"

@implementation HomeMenuCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindData:(id)data indexPath:(NSIndexPath *)indexPath
{
    NSString * title = data[indexPath.row];
    self.title.text = title;
}
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.title.textColor = RGB(249,118,118);
        self.title.font = [UIFont systemFontOfSize:16];
    }else{
        self.title.textColor = RGB(34,34,34);
        self.title.font = [UIFont systemFontOfSize:15];
    }
}



@end
