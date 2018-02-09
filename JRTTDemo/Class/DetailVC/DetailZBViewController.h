//
//  DetailZBViewController.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/9.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailZBViewController : UIViewController
@property (weak, nonatomic) IBOutlet ZFPlayerView *playerView;

@property (nonatomic,copy) NSString * live_id;
@end
