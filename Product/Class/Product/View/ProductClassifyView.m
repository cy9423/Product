//
//  ProductClassifyView.m
//  Product
//
//  Created by cy on 16/6/5.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductClassifyView.h"
#import "ProductClassifyFirstCell.h"
#import "ProductClassifyOtherCell.h"

@interface ProductClassifyView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
}
@end

@implementation ProductClassifyView
@synthesize tv;

- (instancetype)initWithFrame:(CGRect)frame With:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 50, SCREEN_HEIGHT - 64 - 50) style:UITableViewStyleGrouped];
        self.tv.delegate = self;
        self.tv.dataSource =self;
        
        [self addSubview:self.tv];
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, frame.size.height - 40, (SCREEN_WIDTH - 50) / 2.0, 40)];
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 50) / 2.0, frame.size.height - 40, (SCREEN_WIDTH - 50) / 2.0, 40)];
        
        [self addSubview:btn1];
        [self addSubview:btn2];
        
        [btn1 setTitle:@"重置" forState:UIControlStateNormal];
        [btn2 setTitle:@"确定" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn2.backgroundColor = [UIColor redColor];
        
        dataArr = [NSMutableArray array];
        [dataArr addObjectsFromArray:arr];
        
        [self.tv registerNib:[UINib nibWithNibName:@"ProductClassifyFirstCell" bundle:nil] forCellReuseIdentifier:@"PCF"];
        
        [self.tv registerNib:[UINib nibWithNibName:@"ProductClassifyOtherCell" bundle:nil] forCellReuseIdentifier:@"PCO"];
    }
    return self;
}

#pragma mark - tableview delegate
//段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return dataArr.count;
    }
    return 0;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ProductClassifyFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PCF" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1)
    {
        ProductClassifyOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PCO" forIndexPath:indexPath];
        [cell updateBtnWith:dataArr[indexPath.row]];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
