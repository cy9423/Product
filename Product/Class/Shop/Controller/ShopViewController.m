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

@interface ShopViewController()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UITableView *table;//列表
@property(nonatomic, assign)NSInteger cellheight;//cell高度
@property(nonatomic, retain)UIButton *price;//计算价格
@property(nonatomic, retain)NSMutableArray *arr;
@end

@implementation ShopViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _cellheight = 40;
        _arr = [[NSMutableArray alloc]init];
        _price = [UIButton buttonWithType:UIButtonTypeSystem];
        _price.frame =CGRectMake(SCREEN_WIDTH-50, 10, 50, 25);
        [_price setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_price setTitle:@"总价" forState:UIControlStateNormal];
        [_price addTarget:self action:@selector(count:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar addSubview:_price];
}

- (void)viewWillDisappear:(BOOL)animated{
    [_price removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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


//按钮的点击事件
- (void)count:(UIBarButtonItem *)button {
    for (ShopCell *cell in _arr) {
        NSLog(@"%@%d件,单价%@", cell.title.text, cell.num, cell.price.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
