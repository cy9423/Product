//
//  NewVC.m
//  Product
//
//  Created by hanxingdl on 16/6/2.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NewsVC.h"
#import "NewsCell.h"
#import "NewsModel.h"
@interface NewsVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, retain)UITableView *table;//列表
@property(nonatomic, assign)NSInteger cellheight;//cell高度
@property(nonatomic, retain)NSMutableArray *tablist;
@end

@implementation NewsVC
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _cellheight = 40;
    }
    return self;
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
    [_table registerClass:[NewsCell class] forCellReuseIdentifier:@"NewsCell"];
    [self.view addSubview:_table];
    [self handelData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self handelData];
}

- (void)handelData{
    //    //开始请求数据
    //    [_table.header beginRefreshing];
    NSDictionary *tempDic = @{@"allNews":@[@{@"pic":@"https://img.alicdn.com/bao/uploaded/i4/TB1EpvhIVXXXXaWXpXXXXXXXXXX_!!0-item_pic.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/imgextra/i1/2231456847/TB2g1ReiXXXXXbPXXXXXXXXXXXX_!!2231456847.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/bao/uploaded/i2/TB1URkDKVXXXXcfXFXXXXXXXXXX_!!0-item_pic.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/bao/uploaded/i1/TB1SUIZJFXXXXXwXpXXXXXXXXXX_!!2-item_pic.png"},
                                           @{@"pic":@"https://img.alicdn.com/bao/uploaded/i1/TB1Lt6.KXXXXXX1XFXXXXXXXXXX_!!0-item_pic.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/imgextra/i4/803415982/TB27x9cXFXXXXb7XpXXXXXXXXXX_!!803415982.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/bao/uploaded/i3/T1zQ5.FA4cXXXXXXXX_!!0-item_pic.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/bao/uploaded/i1/TB1LHmTGFXXXXaOXpXXXXXXXXXX_!!0-item_pic.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/bao/uploaded/i3/TB1KX9gHXXXXXbEXVXXXXXXXXXX_!!0-item_pic.jpg"},
                                           @{@"pic":@"https://img.alicdn.com/imgextra/i3/2294044846/TB2mjYspXXXXXbaXpXXXXXXXXXX_!!2294044846.jpg"}]};
    _tablist = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in [tempDic objectForKey:@"allNews"]) {
        NewsModel *mod = [NewsModel modWithDic:dic];
        [_tablist addObject:mod];
    }
    [_table reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    判断cell种类
    //    LaborCellModel *mod = [LaborCellModel modWithDic:self.modArr[indexPath.row]];
    //    if ([mod.template_a isEqualToString:@"pic1"]) {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    cell.mod = _tablist[indexPath.row];
    _cellheight = cell.height;
    return cell;
    //    }
}

//动态设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellheight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tablist.count;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.view.userInteractionEnabled = NO;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end