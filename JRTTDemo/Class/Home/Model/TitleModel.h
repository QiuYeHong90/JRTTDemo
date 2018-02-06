

/**
 * Copyright 2018 WHC_DataModelFactory
 * Auto-generated: 2018-02-06 14:18:47
 *
 * @author netyouli (whc)
 * @website http://wuhaichao.com
 * @github https://github.com/netyouli
 */



@interface T1Data :NSObject
@property (nonatomic , copy) NSString              * category;
@property (nonatomic , assign) NSInteger              tip_new;
@property (nonatomic , assign) NSInteger              default_add;
@property (nonatomic , copy) NSString              * web_url;
@property (nonatomic , copy) NSString              * concern_id;
@property (nonatomic , copy) NSString              * icon_url;
@property (nonatomic , assign) NSInteger              flags;
@property (nonatomic , assign) NSInteger              type;
@property (nonatomic , copy) NSString              * name;

@end

@interface Pre_data :NSObject

@end

@interface TTData :NSObject
@property (nonatomic , copy) NSString              * version;
@property (nonatomic , copy) NSMutableArray<T1Data *>              * data;
@property (nonatomic , copy) NSArray<Pre_data *>              * pre_data;

@end

@interface TitleModel :NSObject
@property (nonatomic , copy) NSString              * message;
@property (nonatomic , strong) TTData              * data;

@end

