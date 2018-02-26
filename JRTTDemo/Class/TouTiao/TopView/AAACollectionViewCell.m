//
//  AAACollectionViewCell.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "AAACollectionViewCell.h"

@implementation AAACollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)bindData:(id)data indexPath:(NSIndexPath *)indexPath
{
    NSString  * title = data[indexPath.row];
    self.title.text = title;
}
@end
