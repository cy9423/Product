//
//  ProductViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductClassifyViewController.h"
#import "Product.h"
#import "ProductMessageViewController.h"

@interface ProductViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;
    NSMutableArray *dataArr;
    NSMutableArray *picArr;
    NSMutableArray *titleArr;
    UIButton *setBtn;
    ProductHeaderView *pv;
}

@property (nonatomic,strong) ProductCategoryViewController *pcc;
@property (nonatomic,strong) ProductClassifyViewController *pcf;
@end

@implementation ProductViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        setBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        setBtn.frame =CGRectMake(SCREEN_WIDTH - 45, 10, 25, 25);
        [setBtn setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
        [setBtn addTarget:self action:@selector(setting) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar addSubview:setBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [setBtn removeFromSuperview];
}
#pragma mark - 设置
- (void)setting
{
    ProductMessageViewController *pmc = [[ProductMessageViewController alloc] init];
    [self.navigationController pushViewController:pmc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self createTableView];
    
    [self createTableHeaderView];
}

- (void)initData
{
    dataArr = [NSMutableArray arrayWithObjects:@"秒杀底价",@"商贸精品",@"近期热门",@"人气店铺",@"装修好货",@"居家必败",@"猜你喜欢", nil];
    picArr = [NSMutableArray arrayWithObjects:@"6_02",@"6_03",@"6_04",@"6_05", nil];
    
    titleArr = [NSMutableArray arrayWithObjects:@"买啥都2快",@"促销大减价",@"就是便宜",@"快来买啊", nil];
}

- (void)createTableHeaderView
{
    pv = [[[NSBundle mainBundle]loadNibNamed:@"ProductHeaderView" owner:nil options:nil] firstObject];

    pv.frame = CGRectMake(0, 0, SCREEN_WIDTH, 400);
    
    [pv updateViewWith:picArr And:titleArr];
    
    __weak typeof(self)weakself = self;
    pv.btnBlcok = ^(int a){
        if (a < 3) {
            weakself.pcc = [[ProductCategoryViewController alloc] init];
            
            [weakself.navigationController pushViewController:weakself.pcc animated:YES];
        }
        if (a == 3) {
            weakself.pcf = [[ProductClassifyViewController alloc] init];
            [weakself.navigationController pushViewController:weakself.pcf animated:YES];
        }
       
    };
    
    tv.tableHeaderView = pv;
}

- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    
    tv.delegate = self;
    tv.dataSource = self;
    
    [self.view addSubview:tv];
    
    [tv registerNib:[UINib nibWithNibName:@"ProductFirstCell" bundle:nil] forCellReuseIdentifier:@"pdFirst"];
    [tv registerNib:[UINib nibWithNibName:@"ProductSecondCell" bundle:nil] forCellReuseIdentifier:@"pdSecond"];
    [tv registerNib:[UINib nibWithNibName:@"ProductDoubleCell" bundle:nil] forCellReuseIdentifier:@"pdDouble"];
    [tv registerNib:[UINib nibWithNibName:@"ProductSingularCell" bundle:nil] forCellReuseIdentifier:@"pdSingular"];
    
}
#pragma mark - tableview delegate
//段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArr.count;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ProductFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdFirst" forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section == 1) {
        ProductSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdSecond" forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section > 1 && indexPath.section %2 ==0) {
        ProductDoubleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdDouble" forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section > 1 && indexPath.section %2 !=0) {
        ProductSingularCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdSingular" forIndexPath:indexPath];
        
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //去除选中停留效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 300.0;
    }
    else
    {
        return 200;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
   
    v.backgroundColor = [UIColor whiteColor];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH - 40, 30)];
    [v addSubview:lb];
    
    lb.text = dataArr[section];
    lb.font = [UIFont boldSystemFontOfSize:20];
    lb.textAlignment = NSTextAlignmentCenter;
    
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
