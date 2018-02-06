//
//  ImgLeftTableViewCell.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "TWTableViewCell.h"
#import <UIKit/UIKit.h>

@interface ImgLeftTableViewCell : TWTableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImg_W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImg_H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Img_margin_Right;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightX;



@end
