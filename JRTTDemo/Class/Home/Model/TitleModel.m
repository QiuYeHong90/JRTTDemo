//
//  TitleModel.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import <NSObject+YYModel.h>
#import "TitleModel.h"

@implementation T1Data

@end
@implementation Pre_data

@end
@implementation TTData
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"data" : [T1Data class],
             @"pre_data" : [Pre_data class],
             };
}

@end
@implementation TitleModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"data" : [TTData class]
             };
}
@end

