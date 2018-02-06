//
//  NSString+Date.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/30.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import <CommonUtils.h>
#import "NSString+Date.h"

@implementation NSString (Date)
+(NSString*)getTimeToData:(NSString*)timeInterval{
    double huodoS =[timeInterval doubleValue];
    NSDate*detaildate=[NSDate dateWithTimeIntervalSince1970:huodoS];
//    获取当前时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval currentS=[dat timeIntervalSince1970];
    
    
    
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString*currentDateStr = [dateFormatter stringFromDate:detaildate];
   
    
    if (currentS<huodoS) {
        //            活动有效
        
    }else{
        //            活动结束
        return nil;
    }
    
    
    NSInteger flag = [detaildate daysAgo];
    
    if (flag>0) {
//        还有好几天
        return [detaildate stringWithFormat:[NSDate ymdHmsFormat]];
    }else if(flag==0){
//        今天
        return [detaildate stringWithFormat:[NSDate hmsFormat]];
    }else{
//        不是今天已过期
        return nil;
    }
    
    return currentDateStr;
    
    
}
@end
