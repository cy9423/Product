//
//  LaborVC.m
//  Product
//
//  Created by hanxingdl on 16/4/14.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "LaborVC.h"
#import "LaborCell.h"
#import "LaborCellModel.h"
#import "AddLaborVC.h"
@interface LaborVC()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UIButton *addlab;//下单按钮
@property(nonatomic, retain)UITableView *table;//列表
@property(nonatomic, assign)NSInteger cellheight;//cell高度
@end

@implementation LaborVC//用工
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _addlab = [UIButton buttonWithType:UIButtonTypeSystem];
        _addlab.frame =CGRectMake(SCREEN_WIDTH-50, 10, 50, 25);
        [_addlab setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addlab setTitle:@"下单" forState:UIControlStateNormal];
        [_addlab addTarget:self action:@selector(pushAdd:) forControlEvents:UIControlEventTouchUpInside];
        _cellheight = 40;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_addlab];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_addlab removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建tableview
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-48) style:UITableViewStylePlain];
    _table.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];//分割线
    [self.view addSubview:_table];
    
    //    //开始请求数据
    //    [_table.header beginRefreshing];
    //    //    注册cell
    [_table registerClass:[LaborCell class] forCellReuseIdentifier:@"LaborCell"];
}

//判断cell种类
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LaborCellModel *mod = [LaborCellModel makeValue];
    //    LaborCellModel *mod = [LaborCellModel modWithDic:self.modArr[indexPath.row]];
    //    if ([mod.template_a isEqualToString:@"pic1"]) {
    LaborCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LaborCell"];
    cell.mod = mod;
    _cellheight = cell.height;
    return cell;
    //    }
}

//动态设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellheight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
    //    return self.modArr.count;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    self.view.userInteractionEnabled = NO;
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    ZGLHotDetailsVC *hotDetails = [[ZGLHotDetailsVC alloc]init];
    //    hotDetails.docid = [self.modArr[indexPath.row]objectForKey:@"docid"];
    //    [self.navigationController pushViewController:hotDetails animated:YES];
    //    self.view.userInteractionEnabled = YES;
}

- (void)pushAdd:(UIBarButtonItem *)button {
    AddLaborVC *add = [[AddLaborVC alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
