//
//  ProductCategoryViewController.m
//  Product
//
//  Created by cy on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductCategoryViewController.h"
#import "ProductCategoryCell.h"
#import "ProductInfoViewController.h"

@interface ProductCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;
    NSMutableArray *dataArr;
}
@end

@implementation ProductCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataArr = [NSMutableArray arrayWithObjects:@"为你推荐",@"灯饰照明",@"卫浴用品",@"厨房用品",@"家居软装",@"为你推荐",@"灯饰照明",@"卫浴用品",@"厨房用品",@"家居软装", nil];
    [self createTableView];
}

- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT  - 64) style:UITableViewStylePlain];
    
    tv.delegate = self;
    tv.dataSource = self;
  
    [self.view addSubview:tv];
    [tv registerNib:[UINib nibWithNibName:@"ProductCategoryCell" bundle:nil] forCellReuseIdentifier:@"pdCategory"];
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
    ProductCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdCategory" forIndexPath:indexPath];
    
    cell.block = ^(){
      
        ProductInfoViewController *pvc = [[ProductInfoViewController alloc] init];
        
        [self.navigationController pushViewController:pvc animated:YES];
    };
    
    [cell updateCellWith:dataArr];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREEN_HEIGHT - 49;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
