

/**
 * Copyright 2018 WHC_DataModelFactory
 * Auto-generated: 2018-02-05 11:40:35
 *
 * @author netyouli (whc)
 * @website http://wuhaichao.com
 * @github https://github.com/netyouli
 */



@interface Media_info :NSObject
@property (nonatomic , assign) BOOL              follow;
@property (nonatomic , assign) BOOL              is_star_user;
@property (nonatomic , copy) NSString              * recommend_reason;
@property (nonatomic , assign) BOOL              user_verified;
@property (nonatomic , assign) NSInteger              media_id;
@property (nonatomic , copy) NSString              * verified_content;
@property (nonatomic , assign) NSInteger              user_id;
@property (nonatomic , assign) NSInteger              recommend_type;
@property (nonatomic , copy) NSString              * avatar_url;
@property (nonatomic , copy) NSString              * name;

@end

@interface Log_pb :NSObject
@property (nonatomic , copy) NSString              * impr_id;

@end

@interface Extra :NSObject

@end

@interface Action_list :NSObject
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic , assign) NSInteger              action;
@property (nonatomic , strong) Extra              * extra;

@end

@interface Forward_info :NSObject
@property (nonatomic , assign) NSInteger              forward_count;

@end
@interface Middle_image :NSObject
@property (nonatomic , assign) NSInteger              width;

@property (nonatomic , assign) NSInteger              height;
@property (nonatomic , copy) NSString              * uri;
@property (nonatomic , copy) NSString              * url;

@end
@interface User_info :NSObject
@property (nonatomic , assign) BOOL              follow;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * user_auth_info;
@property (nonatomic , assign) BOOL              user_verified;
@property (nonatomic , copy) NSString              * verified_content;
@property (nonatomic , assign) NSInteger              user_id;
@property (nonatomic , copy) NSString              * description;
@property (nonatomic , copy) NSString              * avatar_url;
@property (nonatomic , assign) NSInteger              follower_count;

@end

@interface Ugc_recommend :NSObject
@property (nonatomic , copy) NSString              * activity;
@property (nonatomic , copy) NSString              * reason;

@end

@interface ContentModel :NSObject
@property (nonatomic , assign) NSInteger              item_id;
@property (nonatomic , assign) NSInteger              cell_flag;
@property (nonatomic , assign) NSInteger              behot_time;
@property (nonatomic , assign) NSInteger              tip;
@property (nonatomic , assign) NSInteger              publish_time;
@property (nonatomic , copy) NSString              * content_decoration;
@property (nonatomic , assign) NSInteger              source_icon_style;
@property (nonatomic , assign) NSInteger              tag_id;
@property (nonatomic , strong) Media_info              * media_info;
@property (nonatomic , assign) NSInteger              preload_web;
@property (nonatomic , assign) NSInteger              cell_layout_style;
@property (nonatomic , assign) NSInteger              group_id;
@property (nonatomic , assign) NSInteger              cell_type;
@property (nonatomic , strong) Log_pb              * log_pb;
@property (nonatomic , copy) NSString              * media_name;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , assign) NSInteger              user_repin;
@property (nonatomic , copy) NSString              * display_url;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , assign) NSInteger              repin_count;
@property (nonatomic , copy) NSString              * stick_label;
@property (nonatomic , assign) BOOL              show_portrait_article;
@property (nonatomic , copy) NSArray<Action_list *>              * action_list;
@property (nonatomic , assign) NSInteger              digg_count;
@property (nonatomic , assign) BOOL              has_m3u8_video;
@property (nonatomic , assign) BOOL              has_video;
@property (nonatomic , assign) NSInteger              item_version;
@property (nonatomic , assign) NSInteger              share_count;
@property (nonatomic , copy) NSString              * source;
@property (nonatomic , assign) NSInteger              comment_count;
@property (nonatomic , assign) NSInteger              cursor;
@property (nonatomic , assign) NSInteger              video_style;
@property (nonatomic , assign) BOOL              show_portrait;
@property (nonatomic , assign) NSInteger              stick_style;
@property (nonatomic , copy) NSString              * action_extra;
@property (nonatomic , assign) NSInteger              ignore_web_transform;
@property (nonatomic , strong) Forward_info              * forward_info;
@property (nonatomic , assign) BOOL              is_stick;
@property (nonatomic , copy) NSString              * verified_content;
@property (nonatomic , copy) NSString              * share_url;
@property (nonatomic , assign) NSInteger              bury_count;
@property (nonatomic , assign) NSInteger              article_sub_type;
@property (nonatomic , assign) BOOL              allow_download;
@property (nonatomic , copy) NSString              * tag;
@property (nonatomic , strong) User_info              * user_info;
@property (nonatomic , assign) NSInteger              level;
@property (nonatomic , assign) NSInteger              read_count;
@property (nonatomic , assign) NSInteger              article_type;
@property (nonatomic , assign) NSInteger              user_verified;
@property (nonatomic , copy) NSString              * rid;
@property (nonatomic , copy) NSString              * abstract;
@property (nonatomic , assign) BOOL              is_subject;
@property (nonatomic , assign) NSInteger              hot;
@property (nonatomic , copy) NSString              * keywords;
@property (nonatomic , assign) NSInteger              label_style;
@property (nonatomic , assign) BOOL              show_dislike;
@property (nonatomic , copy) NSString              * article_url;
@property (nonatomic , assign) NSInteger              ban_comment;
@property (nonatomic , copy) NSString              * source_open_url;
@property (nonatomic , strong) Ugc_recommend              * ugc_recommend;
@property (nonatomic , copy) NSString              * label;
@property (nonatomic , assign) NSInteger              aggr_type;
@property (nonatomic , assign) NSInteger              has_mp4_video;

@property (nonatomic,strong) NSArray * image_list;
@property (nonatomic , strong) Middle_image              * middle_image;
//middle_image
@end

