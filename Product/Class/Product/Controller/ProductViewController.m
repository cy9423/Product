//
//  ProductViewController.m
//  ProductShop
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductViewController.h"
#import "Product.h"


@interface ProductViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;
    NSMutableArray *dataArr;
    NSMutableArray *picArr;
    NSMutableArray *titleArr;
    
    ProductHeaderView *pv;
}

@property (nonatomic,strong) ProductCategoryViewController *pcc;

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self createTableView];
    
    [self createTableHeaderView];
}

- (void)initData
{
    dataArr = [NSMutableArray array];
    picArr = [NSMutableArray arrayWithObjects:@"6_02",@"6_03",@"6_04",@"6_05", nil];
    
    titleArr = [NSMutableArray arrayWithObjects:@"买啥都2快",@"促销大减价",@"就是便宜",@"快来买啊", nil];
}

- (void)createTableHeaderView
{
    pv = [[[NSBundle mainBundle]loadNibNamed:@"ProductHeaderView" owner:nil options:nil] firstObject];

    pv.frame = CGRectMake(0, 0, SCREEN_WIDTH, 400);
    
    [pv updateViewWith:picArr And:titleArr];
    
    pv.btnBlcok = ^(){
        
        _pcc = [[ProductCategoryViewController alloc] init];
        
       [self.navigationController pushViewController:_pcc animated:YES];
       
    };
    
    tv.tableHeaderView = pv;
}

- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    
    tv.delegate = self;
    tv.dataSource = self;
    
    [self.view addSubview:tv];
    
    [tv registerNib:[UINib nibWithNibName:@"ProductFirstCell" bundle:nil] forCellReuseIdentifier:@"pdFirst"];
    [tv registerNib:[UINib nibWithNibName:@"ProductSecondCell" bundle:nil] forCellReuseIdentifier:@"pdSecond"];
    [tv registerNib:[UINib nibWithNibName:@"ProductDoubleCell" bundle:nil] forCellReuseIdentifier:@"pdDouble"];
    [tv registerNib:[UINib nibWithNibName:@"ProductSingularCell" bundle:nil] forCellReuseIdentifier:@"pdSingular"];
    
}
#pragma mark - tableview delegate
//段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ProductFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdFirst" forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section == 1) {
        ProductSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdSecond" forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section > 1 && indexPath.section %2 ==0) {
        ProductDoubleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdDouble" forIndexPath:indexPath];
        
        return cell;
    }
    if (indexPath.section > 1 && indexPath.section %2 !=0) {
        ProductSingularCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdSingular" forIndexPath:indexPath];
        
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //去除选中停留效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 300.0;
    }
    else
    {
        return 200;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
   
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
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
