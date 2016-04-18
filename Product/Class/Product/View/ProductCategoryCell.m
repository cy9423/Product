//
//  ProductCategoryCell.m
//  Product
//
//  Created by cy on 16/4/15.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductCategoryCell.h"
#import "SelectCollectionViewCell.h"

@interface ProductCategoryCell()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *dataArr;
    UIButton *selectBtn;
    float width;
    float height;
}
@end

@implementation ProductCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)updateCellWith:(NSArray *)arr
{
    dataArr = [NSMutableArray array];
    
    NSArray *test = @[@"1",@"2",@"3",@"4"];
    
    [dataArr addObjectsFromArray:test];
    
    width = self.frame.size.width / 3.0;
    height = 80.0;
    
    [self createScrollViewWith:arr];
    
    [self createCollectionView];
}

#pragma mark 制作滚动视图
- (void)createScrollViewWith:(NSArray *)arr
{
    self.btnScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, SCREEN_HEIGHT - 64)];
    [self addSubview:self.btnScrollView];
    
    for (int i = 0; i < arr.count; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, height * i, width, height)];
        
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor magentaColor] forState:UIControlStateSelected];
        
        [self.btnScrollView addSubview:btn];
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setBackgroundColor:[UIColor colorWithRed:252 / 255.0 green:250 / 255.0 blue:252 / 255.0 alpha:1]];
        if (i ==0 ) {
            selectBtn = btn;
            selectBtn.selected = YES;
            [btn setBackgroundColor:[UIColor whiteColor]];
        }
    }
    
    self.btnScrollView.contentSize = CGSizeMake(width, height * arr.count);

}

- (void)onClick:(UIButton *)btn
{
    selectBtn.selected = NO;
    [selectBtn setBackgroundColor:[UIColor colorWithRed:252 / 255.0 green:250 / 255.0 blue:252 / 255.0 alpha:1]];
    btn.selected = YES;
    [btn setBackgroundColor:[UIColor whiteColor]];
    selectBtn = btn;
    
    [self.selectCollectionView reloadData];
}

- (void)createCollectionView
{
    //创建布局类
    self.fl = [[UICollectionViewFlowLayout alloc] init];
    
    //设置属性 滚动方向
    self.fl.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.fl.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    self.selectCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(width, 0, self.frame.size.width - width, SCREEN_HEIGHT- 64 ) collectionViewLayout:self.fl];
    
    self.selectCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.selectCollectionView];
    
    self.selectCollectionView.delegate = self;
    self.selectCollectionView.dataSource = self;
    
    [self.selectCollectionView registerNib:[UINib nibWithNibName:@"SelectCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ProductSelectCell"];
}

#pragma mark - 集合视图代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //集合视图，必须自定义cell
    SelectCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductSelectCell" forIndexPath:indexPath];
    
    return cell;
}

//设置item Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.frame.size.width - width - 20) / 2, 150);
}

////设置段头的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(collectionView.frame.size.width, 20);
//}
//
////设置段尾
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(collectionView.frame.size.width, 50);
//}

//给段头段尾设置size
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    //段头段尾需要创建自定义视图
//    HeaderFooterView * hfView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"view" forIndexPath:indexPath];
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        hfView.label.text = @"段头";
//    }
//    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
//        hfView.label.text = @"段尾";
//    }
//    
//    return hfView;
//    
//}


#pragma mark -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.block();
}

@end
