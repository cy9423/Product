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

@interface ProductInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;
    
    NSMutableArray *dataArr;
}
@end

@implementation ProductInfoViewController


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.toolbar.barStyle = UIBarStyleBlack;
    
    UIButton *btn_1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    [btn_1 setTitle:@"客服" forState:UIControlStateNormal];
    [btn_1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIButton *btn_2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, (SCREEN_WIDTH - 200) / 2.0, 45)];
    [btn_2 setTitle:@"立即购买" forState:UIControlStateNormal];
    [btn_2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_2 setBackgroundColor:[UIColor orangeColor]];
    
    UIButton *btn_3 = [[UIButton alloc] initWithFrame:CGRectMake(100 + (SCREEN_WIDTH - 200) / 2.0, 0, (SCREEN_WIDTH - 200) / 2.0, 45)];
    [btn_3 setTitle:@"加入购物车" forState:UIControlStateNormal];
    [btn_3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_3 setBackgroundColor:[UIColor magentaColor]];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithCustomView:btn_1];
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithCustomView:btn_2];
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc] initWithCustomView:btn_3];
    NSArray *arr = [NSArray arrayWithObjects:btn1,btn2,btn3, nil];
    self.toolbarItems = arr;
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

@end
