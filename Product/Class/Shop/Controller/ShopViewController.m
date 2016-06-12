//
//  ShopViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopCell.h"
#import "ShopModel.h"
#import "ProductInfoViewController.h"

@interface ShopViewController()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain)UITableView *table;//列表
@property(nonatomic, assign)NSInteger cellheight;//cell高度
@property(nonatomic, retain)NSMutableArray *arr;
@end

@implementation ShopViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _cellheight = 40;
        _arr = [[NSMutableArray alloc]init];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTableView];

}

#pragma mark - 创建UITableView
- (void)createTableView
{
    //创建tableview
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-40) style:UITableViewStyleGrouped];
    _table.backgroundColor = [UIColor lightGrayColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];//分割线
    [self.view addSubview:_table];
    [_table registerClass:[ShopCell class] forCellReuseIdentifier:@"ShopCell"];
}


//判断cell种类
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopModel *mod = [[ShopModel alloc]init];
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCell"];
    cell.mod = mod;
    [_arr addObject:cell];
    _cellheight = cell.height;
    return cell;
}

//动态设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellheight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *headerView = [[UILabel alloc]initWithFrame:CGRectMake(35, 5, SCREEN_WIDTH, 25)];
    headerView.textColor = [UIColor redColor];
    headerView.text = @"A.O.Smith";
    UIView *headerBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headerBack.backgroundColor = [UIColor whiteColor];
    [headerBack addSubview:headerView];
    return headerBack;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductInfoViewController *pic = [[ProductInfoViewController alloc] init];
    [self.navigationController pushViewController:pic animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
