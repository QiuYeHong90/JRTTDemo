//
//  UIViewController+addA.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/6.
//  Copyright © 2018年 袁书辉. All rights reserved.
//
#import <objc/runtime.h>
#import "UIViewController+addA.h"

@implementation UIViewController (addA)
static char  tModelKey = 'tModel';
-(void)setTModel:(T1Data *)tModel
{
    objc_setAssociatedObject(self, tModelKey, tModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(T1Data *)tModel
{
   return  objc_getAssociatedObject(self, tModelKey);
}

@end
