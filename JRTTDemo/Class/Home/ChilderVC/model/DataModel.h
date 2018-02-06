

/**
 * Copyright 2018 WHC_DataModelFactory
 * Auto-generated: 2018-02-05 11:56:28
 *
 * @author netyouli (whc)
 * @website http://wuhaichao.com
 * @github https://github.com/netyouli
 */


#import "ContentModel.h"

@interface Sub_entrance_list :NSObject

@end

@interface Tips :NSObject
@property (nonatomic , copy) NSString              * display_template;
@property (nonatomic , assign) NSInteger              display_duration;
@property (nonatomic , copy) NSString              * display_info;
@property (nonatomic , copy) NSString              * web_url;
@property (nonatomic , copy) NSString              * download_url;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * open_url;
@property (nonatomic , copy) NSString              * app_name;
@property (nonatomic , copy) NSString              * package_name;

@end

@interface Data :NSObject
@property (nonatomic,copy) NSString * content;
@property (nonatomic,copy) NSString * code;
@property (nonatomic,strong) NSDictionary * model;

@property (nonatomic,strong) NSNumber * cellHeight;
@property (nonatomic,assign) BOOL RightX124;

-(CGFloat)middle_image_MarginR;
-(CGFloat)middle_image_W;
-(CGFloat)middle_image_H;

-(BOOL)hasMiddle_image;
-(BOOL)hasImage_list;


@end

@interface DataModel :NSObject

@property (nonatomic , copy) NSArray<Sub_entrance_list *>              * sub_entrance_list;
@property (nonatomic , assign) NSInteger              show_et_status;
@property (nonatomic , copy) NSString              * message;
@property (nonatomic , assign) BOOL              has_more;
@property (nonatomic , copy) NSString              * post_content_hint;
@property (nonatomic , assign) BOOL              has_more_to_refresh;
@property (nonatomic , assign) NSInteger              feed_flag;
@property (nonatomic , assign) NSInteger              total_number;
@property (nonatomic , strong) Tips              * tips;
@property (nonatomic , copy) NSMutableArray<Data *>              * data;
@property (nonatomic , assign) NSInteger              login_status;
@property (nonatomic , assign) NSInteger              action_to_last_stick;

@end

