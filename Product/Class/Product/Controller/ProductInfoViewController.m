//
//  ProductInfoViewController.m
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductInfoViewController.h"
#import "ProductInfoHeaderView.h"
#import "ProductInfoFirstCell.h"
#import "ProductInfoSecondCell.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "ProductMessageViewController.h"
#import <MAMapKit/MAMapKit.h>
@interface ProductInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UMSocialUIDelegate,MAMapViewDelegate>
{
    UITableView *tv;
    NSMutableArray *dataArr;
    UIButton *shareBtn;
    UIButton *setBtn;
    UIButton *favoriteBtn;
    MAMapView *_mapView;
}
@end

@implementation ProductInfoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        favoriteBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 125, 10, 25, 25)];
        [favoriteBtn setBackgroundImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        [favoriteBtn addTarget:self action:@selector(favorite) forControlEvents:UIControlEventTouchUpInside];
        
        shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        shareBtn.frame =CGRectMake(SCREEN_WIDTH - 90, 10, 25, 25);
        [shareBtn setBackgroundImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
        
        setBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        setBtn.frame =CGRectMake(SCREEN_WIDTH - 45, 10, 25, 25);
        [setBtn setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
        [setBtn addTarget:self action:@selector(setting) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - 分享
- (void)share
{
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"https://www.baidu.com/";
    [UMSocialData defaultData].extConfig.wechatFavoriteData.url = @"https://www.baidu.com/";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"https://www.baidu.com/";
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"568ccedde0f55ab214000a3e" shareText:[NSString stringWithFormat:@"test%@",@"https://www.baidu.com/"] shareImage:[UIImage imageNamed:@"m2"] shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite] delegate:self];
}

#pragma mark - 设置
- (void)setting
{
    ProductMessageViewController *pmc = [[ProductMessageViewController alloc] init];
    [self.navigationController pushViewController:pmc animated:YES];
}

#pragma mark - 收藏
- (void)favorite
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"商品已被收藏" preferredStyle: UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alert animated:true completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.toolbar.barStyle = UIBarStyleBlack;
    
    UIButton *btn_1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 45)];
    [btn_1 setTitle:@"客服" forState:UIControlStateNormal];
    [btn_1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_1.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    UIButton *btn_2 = [[UIButton alloc] initWithFrame:CGRectMake(80, 0, 80, 45)];
    [btn_2 setTitle:@"立即购买" forState:UIControlStateNormal];
    [btn_2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[btn_2 setBackgroundColor:[UIColor orangeColor]];
    btn_2.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    UIButton *btn_3 = [[UIButton alloc] initWithFrame:CGRectMake(160, 0, 80, 45)];
    [btn_3 setTitle:@"加入购物车" forState:UIControlStateNormal];
    [btn_3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[btn_3 setBackgroundColor:[UIColor magentaColor]];
     btn_3.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    
    UIButton *btn_4 = [[UIButton alloc] initWithFrame:CGRectMake(240, 0, 80, 45)];
    [btn_4 setTitle:@"店铺" forState:UIControlStateNormal];
    [btn_4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[btn_4 setBackgroundColor:[UIColor cyanColor]];
    btn_4.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithCustomView:btn_1];
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithCustomView:btn_2];
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc] initWithCustomView:btn_3];
    UIBarButtonItem *btn4 = [[UIBarButtonItem alloc] initWithCustomView:btn_4];
    NSArray *arr = [NSArray arrayWithObjects:btn1,btn2,btn3,btn4, nil];
    self.toolbarItems = arr;
    
    [self.navigationController.navigationBar addSubview:shareBtn];
    [self.navigationController.navigationBar addSubview:setBtn];
    [self.navigationController.navigationBar addSubview:favoriteBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
    [shareBtn removeFromSuperview];
    [setBtn removeFromSuperview];
    [favoriteBtn removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置友盟key
    [UMSocialData setAppKey:@"568ccedde0f55ab214000a3e"];
    
    [UMSocialWechatHandler setWXAppId:@"wx87a53db0526ec705" appSecret:@"304dc6f2b158e4d704af9682f451a496" url:@"http://www.1000phone.com"];
    [MAMapServices sharedServices].apiKey = @"f44867c4fea5789202958aba4aca5d57";
    [self initDataSource];
    
    [self createTableView];
    
    [self createTableViewHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initDataSource
{
    dataArr = [NSMutableArray arrayWithObjects:@"6_02",@"6_03",@"6_04",@"6_05", nil];
}

- (void)createTableView
{
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    tv.delegate = self;
    tv.dataSource = self;
    
    [tv registerNib:[UINib nibWithNibName:@"ProductInfoFirstCell" bundle:nil] forCellReuseIdentifier:@"pdInfoFirst"];
    [tv registerNib:[UINib nibWithNibName:@"ProductInfoSecondCell" bundle:nil] forCellReuseIdentifier:@"pdInfoSecond"];
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - tableview delegate
//段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ProductInfoFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdInfoFirst" forIndexPath:indexPath];
        cell.block = ^(){
            _mapView.showsUserLocation = YES;
            _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
            _mapView.delegate = self;
            [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
            [self.view addSubview:_mapView];
            
        };
        return cell;
    }
    if (indexPath.row == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = @"”1288-5送光源“";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.row == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = @"送至：广东 深圳 南山区";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.row == 3) {
        ProductInfoSecondCell * cell = [tableView dequeueReusableCellWithIdentifier:@"pdInfoSecond" forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 135.0;
    }
    else
    {
        return 50.0;
    }
}

- (void)createTableViewHeaderView
{
    ProductInfoHeaderView *pv = [[[NSBundle mainBundle]loadNibNamed:@"ProductInfoHeaderView" owner:nil options:nil] lastObject];
    
    [pv updateViewWith:dataArr];
    
    tv.tableHeaderView = pv;
}


-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}

@end
