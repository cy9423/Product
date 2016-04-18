//
//  WorkerVC.m
//  Product
//
//  Created by hanxingdl on 16/4/14.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "WorkerVC.h"
#import "WorkerCell.h"
#import "WorkerCellModel.h"
@interface WorkerVC()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UITableView *table;//列表
@property(nonatomic, assign)NSInteger cellheight;//cell高度
@end

@implementation WorkerVC//散工
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _cellheight = 40;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建tableview
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-112) style:UITableViewStylePlain];
    _table.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];//分割线
    [self.view addSubview:_table];
    
    [_table registerClass:[WorkerCell class] forCellReuseIdentifier:@"WorkerCell"];
}

//判断cell种类
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WorkerCellModel *mod = [[WorkerCellModel alloc]init];
    WorkerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorkerCell"];
    cell.mod = mod;
    _cellheight = cell.height;
    return cell;
}

//动态设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellheight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

