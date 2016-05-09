//
//  MeViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UITableView *table;
@property(nonatomic, retain)NSArray *tablist;
@property(nonatomic, assign)BOOL orderEx;//判断我的订单cell是否展开
@property(nonatomic, assign)BOOL conEx;//判断联系我们cell是否展开
@end

@implementation MeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = TabBarBackGroundColor;
    _orderEx = NO;//不展开
    _conEx = NO;//不展开
    
    //这里是标题view
    _table.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.375)];
    _table.tableHeaderView.backgroundColor = TabBarBackGroundColor;
    //    if (logName == nil) {
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    lab.center = _table.tableHeaderView.center;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"请登录";
    [_table.tableHeaderView addSubview:lab];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(login:)];
    [_table.tableHeaderView addGestureRecognizer:tapGesture];
    //    }else{
    //        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    //        lab.center = _table.tableHeaderView.center;
    //        lab.textAlignment = NSTextAlignmentCenter;
    //        lab.text = [NSString stringWithFormat:@"Welcome, %@", logName];
    //        [_table.tableHeaderView addSubview:lab];
    //    }
    
    _table.backgroundColor = TabBarBackGroundColor;
    [_table reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tablist = [NSArray arrayWithObjects:@"个人设置",
                @"我的收藏",
                @"我的订单",
                @"          我下的订单",
                @"          我接的订单",
                @"我的积分",
                @"我的优惠券", @"联系我们",@"          电话：0411-82400986",nil];
    [self createTableView];
}

- (void)createTableView{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStylePlain];
//    _table.bounces = NO;
    _table.tableFooterView = [[UIView alloc]init];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
//    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //不使用重用池
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = _tablist[indexPath.row];
    //    cell.backgroundColor = foreColor;
    //    cell.textLabel.textColor = artiColor;
    
    NSInteger num = [self getNum:indexPath];//num指cell是数组第几个
    //这里写cell上加什么额外的零件
    switch (num) {
        case 0:{
            
        }return cell;
        case 1:{
            
        }return cell;
        case 2:{
            
        }return cell;
        case 3:{
            if (!_orderEx) {
                cell.textLabel.text = @"";
            }
        }return cell;
        case 4:{
            if (!_orderEx) {
                cell.textLabel.text = @"";
            }
        }return cell;
        case 8:{
            if (!_conEx) {
                cell.textLabel.text = @"";
            }
        }return cell;
        default:
            return cell;
    }
}

//一个自定义的计算cell位置的函数
- (NSInteger)getNum:(NSIndexPath *)path{
    //    switch (path.section) {
    //        case 0:
    return path.row;
    //        case 1:
    //            return 5 + path.row;
    //        default:
    //            return 0;
    //    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tablist.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3||indexPath.row == 4) {
        if (!_orderEx) {
            return 0;
        }
    }
    if (indexPath.row == 8) {
        if (!_conEx) {
            return 0;
        }
    }
    return 40;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    //    if (section == 1) {
//    //        return 20;
//    //    }else{
//    return 0;
//    //    }
//}
//
////分隔栏的颜色
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]init];
//    //    view.backgroundColor = naviColor;
//    //    view.tag = 3003;
//    return view;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.view.userInteractionEnabled = NO;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //将点击事件单独拿出来
    [self selectWithTag:indexPath.row];
    self.view.userInteractionEnabled = YES;
}

//这里写cell点击事件
- (void)selectWithTag:(NSInteger)tag{
    switch (tag) {
        case 0:{}
            break;
        case 1:{}
            break;
            
        case 2:{
            _orderEx = !_orderEx;
            [_table reloadData];
        }break;
            
        case 3:{}
            break;
        case 7:{
            _conEx = !_conEx;
            [_table reloadData];
        }
        case 8:{

        }
            break;
        default:
            break;
    }
}

//登录
- (void)login:(UITapGestureRecognizer *)tap{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
