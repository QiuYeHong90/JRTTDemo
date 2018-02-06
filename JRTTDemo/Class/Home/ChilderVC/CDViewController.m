//
//  CDViewController.m
//  JRTTDemo
//
//  Created by 赵 on 2018/1/26.
//  Copyright © 2018年 袁书辉. All rights reserved.
//

#import "TWTableViewCell.h"

#import "DataModel.h"
#import "CDViewController.h"

@interface CDViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _y;
}
@property (nonatomic,strong) DataModel * sorceModel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray * dataArray;

@end

@implementation CDViewController
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    [PPNetworkHelper GET:@"http://is.snssdk.com/api/news/feed/v76/?list_count=8&concern_id=6286225228934679042&refer=1&refresh_reason=1&session_refresh_idx=9&count=20&min_behot_time=1517209442&last_refresh_sub_entrance_interval=1517209581&loc_mode=7&loc_time=1517208975&latitude=29.534434&longitude=106.563177&city=%E9%87%8D%E5%BA%86%E5%B8%82&tt_from=pull&lac=13150&cid=42682&plugin_enable=3&st_time=1180&iid=24684571231&device_id=43911586446&ac=wifi&channel=huawei&aid=13&app_name=news_article&version_code=656&version_name=6.5.6&device_platform=ios&ab_version=265253%2C255836%2C254306%2C259933%2C263255%2C249686%2C249675%2C264842%2C266617%2C249667%2C267589%2C206075%2C249674%2C261283%2C264457%2C229304%2C265879%2C265545%2C232362%2C265709%2C266353%2C265322%2C239096%2C170988%2C267646%2C267858%2C243585%2C248083%2C258355%2C266157%2C257280%2C261294%2C265122%2C265541%2C258603%2C266386%2C267797%2C260441%2C240865%2C263878%2C267833%2C251713%2C266923%2C262771%2C264317%2C266481%2C229399%2C263926%2C266115%2C262207%2C258356%2C247848%2C228168%2C264452%2C249045%2C244746%2C265583%2C249960%2C264616%2C267847%2C264520%2C263927%2C260656%2C261944%2C241181%2C264292%2C245085%2C265481%2C208278%2C252767%2C249828%2C246859%2C218092&ab_client=a1%2Cc4%2Ce1%2Cf2%2Cg2%2Cf7&ab_feature=94563%2C102749&abflag=3&ssmix=a&device_type=BAC-AL00&device_brand=HUAWEI&language=zh&os_api=24&os_version=7.0&uuid=866432038206049&openudid=50468f33e8fc72cf&manifest_version_code=656&resolution=720*1208&dpi=320&update_version_code=65607&_rticket=1517209581226&plugin=10575&fp=42TqLlm1Pr5_FlHtLrU1FlFSF2Qq&rom_version=emotionui_5.1_bac-al00c00b180&ts=1517209581&as=a295fcf61d5e1a872e2826&cp=50a667e7cb7edq1" parameters:@{
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      @"category":self.tModel111.category
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      } success:^(id responseObject) {
        DataModel * model = [DataModel yy_modelWithJSON:responseObject];
        self.sorceModel = model;
        [self.dataArray setArray:model.data];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Data* obj = self.dataArray[indexPath.row];
    
    NSString * CellInentifer = @"ImgLeftTableViewCell";
    if ([obj hasImage_list]) {
        NSInteger count = [obj.model[@"image_list"] count];
        if (count==3) {
            CellInentifer = @"ImgBottomTableViewCell";
        }
        if (count==1) {
            CellInentifer = @"ImgBottomOneTableViewCell";
        }
        
    }else{
        CellInentifer = @"ImgLeftTableViewCell";
    }
    
    
    TWTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellInentifer];
    
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:CellInentifer owner:self options:nil][0];
    }
    
    [cell setArr:self.dataArray indexPath:indexPath];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Data* obj = self.dataArray[indexPath.row];
    return  [obj.cellHeight floatValue];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat agoY = _y;
    CGFloat nowY = scrollView.contentOffset.y;
    
    if (nowY - agoY >0) {
//        向上
        
    }else{
//        乡下
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
