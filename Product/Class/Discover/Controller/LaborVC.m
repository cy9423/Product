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
#import "LabDetails.h"
@interface LaborVC()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UITableView *table;//列表
@property(nonatomic, assign)NSInteger cellheight;//cell高度
@property(nonatomic, retain)LabDetails *labDetails;//cell点击的详情页面
@property(nonatomic, retain)NSMutableArray *tempArr;
@end

@implementation LaborVC//用工
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _cellheight = 40;
        _tempArr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    //创建tableview
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-113) style:UITableViewStylePlain];
    _table.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];//分割线
    [_table registerClass:[LaborCell class] forCellReuseIdentifier:@"LaborCell"];
    [self.view addSubview:_table];
    
    _labDetails = [[[NSBundle mainBundle]loadNibNamed:@"LabDetails" owner:nil options:nil] lastObject];
    _labDetails.frame = [UIScreen mainScreen].bounds;
    
    [self handelData];
}

- (void)handelData{
    //    //开始请求数据
    //    [_table.header beginRefreshing];
    for (int i=0; i<20; i++) {
        LaborCellModel *mod = [LaborCellModel makeValue];
        [_tempArr addObject:mod];
    }
}

//判断cell种类
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    LaborCellModel *mod = [LaborCellModel modWithDic:self.modArr[indexPath.row]];
//    if ([mod.template_a isEqualToString:@"pic1"]) {
    LaborCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LaborCell"];
    cell.mod = _tempArr[indexPath.row];
    _cellheight = cell.height;
    return cell;
    //    }
}

//动态设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellheight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tempArr.count;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.view.userInteractionEnabled = NO;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _labDetails.mod = _tempArr[indexPath.row];
    [self.view addSubview:_labDetails];
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
