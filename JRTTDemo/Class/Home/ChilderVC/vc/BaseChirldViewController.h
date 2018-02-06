//
//  BaseChirldViewController.h
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import "DataModel.h"
#import <UIKit/UIKit.h>

@interface BaseChirldViewController : UIViewController
@property (nonatomic,strong) T1Data * tModel111;
@property (nonatomic,strong) NSMutableArray * dataArray;
-(void)loadData;
-(void)updateUI;
@end
