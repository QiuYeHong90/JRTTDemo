//
//  DataModel.m
//  JRTTDemo
//
//  Created by 赵 on 2018/2/5.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "DataModel.h"

@implementation Sub_entrance_list

@end
@implementation Tips

@end
@implementation Data
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
-(NSDictionary *)model
{
    
    if (!_model) {
        id obj = [Data dictionaryWithJsonString:self.content];
        _model = obj;
    }
    return _model;
}

-(BOOL)hasMiddle_image
{
    id middle_image = self.model[@"middle_image"];
    if (middle_image) {
        return YES;
    }
    return NO;
}
-(BOOL)hasImage_list
{
    id image_list = self.model[@"image_list"];
    if (image_list) {
        return YES;
    }
    return NO;
}

-(CGFloat)middle_image_H
{
    if ([self hasMiddle_image]) {
        CGFloat w = [self middle_image_W];
        id middle_image = self.model[@"middle_image"];
        float  width = [middle_image[@"width"] floatValue];
        float height = [middle_image[@"height"] floatValue];
        CGFloat h = w *height/width;
        return h;
    }
    
    return 0;
}
-(CGFloat)middle_image_W
{
    CGFloat w = 0;
    
    if ([self hasMiddle_image]) {
        w=124;
        return w;
    }
    
    return w;
}
-(CGFloat)middle_image_MarginR
{
    CGFloat w = 0;
    
    if ([self hasMiddle_image]) {
        w=10;
        return w;
    }
    
    return w;
}

-(NSNumber *)cellHeight
{
    if (!_cellHeight) {
        _cellHeight = @([self Cell_height]);
    }
    return _cellHeight;
}

-(BOOL)RightX124
{
    NSString * title = self.model[@"title"];
    if ([self hasMiddle_image]) {
        CGFloat w = SCREEN_WIDTH - (10+10+10+124);
        CGFloat title_h = [title heightForFont:[UIFont systemFontOfSize:16] width:w];
        CGFloat leftImgH = [self middle_image_H];
        if (leftImgH-title_h>26) {
            
            return YES;
        }
        
    }
    return NO;
}

-(CGFloat)Cell_height
{
    NSString * title = self.model[@"title"];
    
    if ([self hasImage_list]) {
        CGFloat w = SCREEN_WIDTH - (10+10);
        CGFloat title_h = [title heightForFont:[UIFont systemFontOfSize:16] width:w];
        if ([self.model[@"image_list"] count]==3) {
            return title_h+10+125;
        }else{
            return title_h+10+234;
        }
        
        
    }
    
    if ([self hasMiddle_image]) {
         CGFloat w = SCREEN_WIDTH - (10+10+10+124);
         CGFloat title_h = [title heightForFont:[UIFont systemFontOfSize:16] width:w];
         CGFloat leftImgH = [self middle_image_H];
        if (leftImgH-title_h>26) {
            self.RightX124 = YES;
            return leftImgH+10+10;
        }
        self.RightX124 = NO;
        CGFloat maxH = MAX(title_h, leftImgH);
        return maxH+10+36;
    }else{
        
        if (self.model[@"background"][@"video"][@"covers"]) {
            CGFloat w = SCREEN_WIDTH - (10+10);
            CGFloat title_h = [title heightForFont:[UIFont systemFontOfSize:16] width:w];
            return  title_h+224+44;
        }
        
        
        CGFloat w = SCREEN_WIDTH - (10+10);
        CGFloat title_h = [title heightForFont:[UIFont systemFontOfSize:16] width:w];
        return title_h+10+36;
    }
    
    
    
    return 1000;
}

@end
@implementation DataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"data" : [Data class]};
}

@end

