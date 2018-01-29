//
//  JRTTabBarItem.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/29.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "JRTTabBarItem.h"

@implementation JRTTabBarItem

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadUI];
    }
    return self;
}

-(void)loadUI
{
    UIImage * img = self.image;
    self.image = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectedImg =self.selectedImage;
     self.selectedImage = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#686868"]} forState:UIControlStateNormal];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#f85959"]} forState:UIControlStateSelected];
}

@end
