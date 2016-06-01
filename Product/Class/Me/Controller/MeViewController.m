//
//  MeViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "MeViewController.h"
#import "MeModel.h"
#import "settingsController.h"
@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UITableView *table;
@property(nonatomic, retain)NSMutableArray *tablist;
@property(nonatomic, retain)UIButton *login;//用户头像按钮
@end

@implementation MeViewController

static BOOL isLogin;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //初始化用户信息
        isLogin = NO;//默认为未登录
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (isLogin) {
        [self reloadData];//已登录则刷新数据
    }else{
        [self checkName:[MeModel userInfo].name andPassWord:[MeModel userInfo].password withAlert:NO];//尝试自动登录
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = TabBarBackGroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"我";
    
    _tablist = [[NSMutableArray alloc]initWithArray:@[@{@"name":@"我的订单",
                                                        @"expan":@NO,
                                                        @"list":@[@"待付款",
                                                                  @"待收货",
                                                                  @"待评价",
                                                                  @"查看历史订单",
                                                                  @"售后服务",
                                                                  @"退款"]
                                                        },
                                                      @{@"name":@"我的收藏",
                                                        @"expan":@NO,
                                                        @"list":@[@"我的商品",
                                                                  @"我的店铺",
                                                                  @"浏览记录"]
                                                        },
                                                      @{@"name":@"我的优惠券",
                                                        @"expan":@NO,
                                                        @"list":@[@"商家自发自用"]
                                                        },
                                                      @{@"name":@"个人设置",
                                                        @"expan":@NO,
                                                        @"list":@[@"账户安全",
                                                                  @"消息提醒",
                                                                  @"图片质量",
                                                                  @"关于我们",
                                                                  @"意见反馈",
                                                                  @"评分",
                                                                  @"退出登录"]
                                                        }]];
    [self createTableView];
}

#pragma mark - table

- (void)createTableView{
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
    _table.backgroundColor = TabBarBackGroundColor;
    //    _table.bounces = NO;//弹性关闭
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];//分割线
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    //这里是标题view和用户头像按钮
    _table.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    _table.tableHeaderView.backgroundColor = TabBarBackGroundColor;
    
    _login = [UIButton buttonWithType:UIButtonTypeCustom];
    [_login setFrame:CGRectMake((SCREEN_WIDTH-140)/2, 30, 140, 140)];
    _login.layer.cornerRadius = 70;
    _login.layer.masksToBounds = YES;
    [_login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self setLoginImg];//设置头像
    [_table.tableHeaderView addSubview:_login];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_table dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = [_tablist[indexPath.section]objectForKey:@"list"][indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tablist.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:_tablist[section]];
    if ([[dic objectForKey:@"expan"]isEqual:@NO]) {
        return 0;
    }else{
        NSArray *arr = [dic objectForKey:@"list"];
        return arr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *headerView = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [headerView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    [headerView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [headerView setTitle:[_tablist[section] objectForKey:@"name"] forState:UIControlStateNormal];
    headerView.backgroundColor = [UIColor yellowColor];
    [headerView addTarget:self action:@selector(sectionClick:) forControlEvents:UIControlEventTouchUpInside];
    headerView.tag = 300 + section;
    return headerView;
}

- (void)sectionClick:(UIButton *)sectionView{
    for (int i = 0; i<_tablist.count; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:_tablist[i]];
        NSNumber *ex = [dic objectForKey:@"expan"];
        if (i == sectionView.tag-300) {
            [dic setValue: [NSNumber numberWithBool:(!ex.boolValue)] forKey:@"expan"];
        } else {
//            [dic setValue: @NO forKey:@"expan"];//当一项展开时将其他section关闭
        }
        [_tablist replaceObjectAtIndex: i withObject:dic];
    }
    [_table reloadData];
    [_table setContentOffset:CGPointMake(0, _table.contentSize.height>_table.frame.size.height-49?_table.contentSize.height-_table.frame.size.height:-64) animated:YES];//自动偏移到底部
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell点击事件
    switch (indexPath.section) {
        case 0:{
            
        }break;
        case 1:{
            
        }break;
        case 2:{
            
        }break;
        case 3:{
            switch (indexPath.row) {
                case 0:{
                    
                }break;
                case 1:{
                    
                }break;
                case 2:{
                    
                }break;
                case 3:{
                    
                }break;
                case 4:{
                    
                }break;
                case 5:{
                    
                }break;
                case 6:{
                    [MeModel userInfo].name = @"";
                    [MeModel userInfo].password = @"";
                    [MeModel synchro];
                    isLogin = NO;
                    [self setLoginImg];
                    [self sectionClick:[self.view viewWithTag:300+indexPath.section]];
                }break;
                default:
                    break;
            }
        }break;
        default:
            break;
    }
}

#pragma mark - 登录

- (void)login:(UIButton *)button{//点击用户头像
    if (isLogin) {//如果已登录则弹出详细信息
        settingsController *set = [[settingsController alloc]init];
        [self.navigationController pushViewController:set animated:YES];
    } else {//如果未登录则弹出登录对话框
        [self alertWithTitle:@"请登录" andMsg:nil andLoginText:nil andPwdText:nil];
    }
}

- (void)reloadData{//刷新数据
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"file://%@", [[NSBundle mainBundle]pathForResource:@"user" ofType:@"jpg"]],@"login", nil];
    [[MeModel userInfo] setValuesForKeysWithDictionary:dic];
    [self setLoginImg];//修改头像
}

- (void)setLoginImg{//头像
    if (!isLogin) {
        [_login setImage:[UIImage imageNamed:@"NoUser"] forState:UIControlStateNormal];
    }else if ([[MeModel userInfo].login isEqualToString:@""]) {
#warning 判断条件看后台,以后优化
        [_login setImage:[UIImage imageNamed:@"NoPic"] forState:UIControlStateNormal];//登陆后无头像 
    }else {
        [_login setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[MeModel userInfo].login]]] forState:UIControlStateNormal];
    }
}

- (void)checkName:(NSString *)name andPassWord:(NSString *)password withAlert:(BOOL)isAlert {//登录
    _login.userInteractionEnabled = NO;
    if (!([name isEqualToString:@""]||[password isEqualToString:@""])) {//不为空
        if ([name isEqualToString:@"abc"]&&[password isEqualToString:@"123"]) {
            //保存用户名密码到userdefault
            [MeModel userInfo].name = name;
            [MeModel userInfo].password = password;
            [MeModel synchro];
            isLogin = YES;
            [self reloadData];
        }else if(isAlert) {//报错
            [self alertWithTitle:@"请重新登录" andMsg:@"用户名或密码错误" andLoginText:name andPwdText:password];
        }
    }
    _login.userInteractionEnabled = YES;
}

- (void)alertWithTitle: (NSString *)title andMsg: (NSString *)msg andLoginText: (NSString *)name andPwdText: (NSString *)pwd {//登录框封装
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"账号";
        textField.text = name;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
        textField.text = pwd;
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *okAction){
        UITextField *login = alertController.textFields.firstObject;
        UITextField *password = alertController.textFields.lastObject;
        [self checkName:login.text andPassWord:password.text withAlert:YES];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
