//
//  ProductClassifyViewController.m
//  Product
//
//  Created by cy on 16/5/30.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductClassifyViewController.h"
#import "ProductClassifyView.h"
#import "ProductClassifyProductCell.h"
#import "ProductInfoViewController.h"
#define h1 40
#define h2 40
@interface ProductClassifyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *selectBtn1;
    UIButton *selectBtn2;
    UITableView *tv;
    NSMutableArray *dataArr;
    UIView *v1;
    UIView *v2;
    UIView *_v;
    UIView *line1;
    UIView *line2;
    CGFloat oldOffset;
    int a;
}
@property (nonatomic,strong)ProductClassifyView *pcv;

@end

@implementation ProductClassifyViewController

#pragma mark - 自定义视图
- (void)createCustomUI
{
#pragma mark view1
    NSArray *arr = @[@"综合",@"销量",@"价格",@"筛选"];
    v1 = [[UIView alloc] initWithFrame:CGRectMake(20, 64, SCREEN_WIDTH - 40, h1)];
    [self.view addSubview:v1];
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((v1.frame.size.width / 4.0) * i, 0, v1.frame.size.width / 4.0, v1.frame.size.height)];
        [v1 addSubview:btn];
        btn.selected = NO;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(onClick1:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100 + i;
    }
    line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + h1, SCREEN_WIDTH, 1)];
    [self.view addSubview:line1];
    line1.backgroundColor = [UIColor grayColor];
    
#pragma mark view2
    v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + h1 + 1, SCREEN_WIDTH, h2)];
    [self.view addSubview:v2];
    NSArray *art = @[@"配送",@"品牌",@"材质",@"分类"];
    
    float width = v2.frame.size.width;
    float height = v2.frame.size.height;
    
    for (int i = 0; i < art.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20 * (i + 1) + (width - 5 * 20) / 4.0 * i, 5, (width - 5 * 20) / 4.0, height - 10)];
        
        [v2 addSubview:btn];
        [btn setTitle:art[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithRed:241 /255.0 green:242 / 255.0 blue:246 / 255.0 alpha:1]];
        btn.layer.cornerRadius = (height - 10) / 2.0;
        [btn addTarget:self action:@selector(onClick2:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 200 + i;
    }
    line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + h1 +h2 + 1, SCREEN_WIDTH, 1)];
    [self.view addSubview:line2];
    line2.backgroundColor = [UIColor grayColor];
    
}
#pragma mark - 点击事件1
- (void)onClick1:(UIButton *)btn
{
    if(btn.tag - 100 < 3)
    {
        selectBtn1.selected = NO;
        btn.selected = YES;
        selectBtn1 = btn;
    }
    
    if(btn.tag - 100 == 3)
    {
        a = 1;
        NSArray *arr = @[@[@"品牌",@"箭牌(ARROW)",@"TOTO",@"科勒(KOHLER)"],@[@"类别",@"普通马桶",@"智能马桶盖/洁身器",@"智能马桶"],@[@"坐便器坑距",@"185mm",@"190mm",@"220mm"],@[@"坐便器冲水方式",@"喷射虹吸式",@"旋涡虹吸式",@"虹吸式"],@[@"排水方式",@"地排",@"墙排",@"其他"],@[@"马桶盖是否缓冲",@"缓冲",@"不缓冲",@"其他"],@[@"马桶盖材质",@"PP板",@"树脂",@"ABS树脂"]];
        //添加_v
        _v = [[UIView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_v];
        _v.backgroundColor = [UIColor blackColor];
        //添加v
        _pcv = [[ProductClassifyView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 64, SCREEN_WIDTH - 50, SCREEN_HEIGHT - 64) With:arr];
        [self.view addSubview:_pcv];
        
        //开始动画
        [UIView animateWithDuration:0.5 animations:^{
            
            _pcv.frame = CGRectMake(50, 64, SCREEN_WIDTH - 50, SCREEN_HEIGHT - 64);
            
        } completion:^(BOOL finished) {
            
            _v.alpha = 0.8;
           UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan)];
            [_v addGestureRecognizer:pan];
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }];
       
    }
}

- (void)pan
{
    a++;
    if (a == 2) {
        [UIView animateWithDuration:0.5 animations:^{
            _pcv.frame = CGRectMake(SCREEN_WIDTH, 64, SCREEN_WIDTH - 50, SCREEN_HEIGHT - 64);
            _pcv.backgroundColor = [UIColor blackColor];
            
        } completion:^(BOOL finished) {
            
            [_v removeFromSuperview];
            
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }];
    }
    
}
#pragma mark - 点击事件2
- (void)onClick2:(UIButton *)btn
{
    selectBtn2.selected = NO;
    [selectBtn2 setBackgroundColor:[UIColor colorWithRed:241 /255.0 green:242 / 255.0 blue:246 / 255.0 alpha:1]];
    btn.selected = YES;
    [btn setBackgroundColor:[UIColor whiteColor]];
    selectBtn2 = btn;
}
#pragma mark 创建TableView
- (void)createTableView
{
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + h1 + h2 + 2, SCREEN_WIDTH, SCREEN_HEIGHT - (64 + h1 + h2 + 2)) style:UITableViewStylePlain];
    tv.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tv];
    
    tv.delegate = self;
    tv.dataSource = self;
    
    [tv registerNib:[UINib nibWithNibName:@"ProductClassifyProductCell" bundle:nil] forCellReuseIdentifier:@"PCP"];
    
}

#pragma mark - tableview delegate
//段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductClassifyProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PCP" forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ProductInfoViewController *pic = [[ProductInfoViewController alloc] init];
    [self.navigationController pushViewController:pic animated:YES];
}

#pragma mark 页面滑动带动视图移动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y > oldOffset && oldOffset > 0 ){
        self.navigationController.navigationBar.hidden = YES;
        v1.frame = CGRectMake(0, -(h1 + 1), SCREEN_WIDTH - 40, h1);
        line1.frame = CGRectMake(0, - 1, SCREEN_WIDTH, 1);
        v2.frame = CGRectMake(0, 0, SCREEN_WIDTH, h2);
        line2.frame = CGRectMake(0, h2, SCREEN_WIDTH, 1);
        tv.frame = CGRectMake(0, h2, SCREEN_WIDTH, SCREEN_HEIGHT - h2 - 1);
    }
    else{
        self.navigationController.navigationBar.hidden = NO;
        v1.frame = CGRectMake(20, 64, SCREEN_WIDTH - 40, h1);
        line1.frame = CGRectMake(0, 64 + h1, SCREEN_WIDTH, 1);
        v2.frame = CGRectMake(0, 64 + h1 + 1, SCREEN_WIDTH, h2);
        line2.frame = CGRectMake(0, 64 + h1 + h2 +1, SCREEN_WIDTH, 1);
        tv.frame = CGRectMake(0, 64 + h1 + h2 + 2, SCREEN_WIDTH, SCREEN_HEIGHT - (64 + h1 + h2 + 2));
    }
    
    oldOffset = scrollView.contentOffset.y;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createCustomUI];
    
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
