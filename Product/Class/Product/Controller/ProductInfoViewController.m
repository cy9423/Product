//
//  ProductInfoViewController.m
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductInfoViewController.h"
#import "ProductInfoHeaderView.h"

@interface ProductInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;
    
    NSMutableArray *dataArr;
}
@end

@implementation ProductInfoViewController

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
    
    //tv.delegate = self;
    //tv.dataSource = self;
    
    //[tv registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@""];
}

#pragma mark - tableview delegate
//段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}


- (void)createTableViewHeaderView
{
    ProductInfoHeaderView *pv = [[[NSBundle mainBundle]loadNibNamed:@"ProductInfoHeaderView" owner:nil options:nil] lastObject];
    
    [pv updateViewWith:dataArr];
    
    tv.tableHeaderView = pv;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
