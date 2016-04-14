//
//  ProductFirstCell.m
//  Product
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductFirstCell.h"

@implementation ProductFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self customView];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)updateCellWith:(NSArray *)picArr And:(NSArray *)titleArr
{
    self.dataArr = [NSMutableArray arrayWithArray:picArr];
    [self.dataArr insertObject:picArr.lastObject atIndex:0];
    [self.dataArr addObject:picArr.firstObject];
    
    self.titleArr = [NSMutableArray arrayWithArray:titleArr];
    [self.titleArr insertObject:titleArr.lastObject atIndex:0];
    [self.titleArr addObject:titleArr.firstObject];
    
    self.page = 0;
    self.num = 0;
    
    [self createSdView];
    
    [self createAdView];
}

- (void)customView
{
    float w = (self.frame.size.width - 160) / 5.0;
    
    NSArray *arr = @[@"ico_wujin",@"ico_jiancai",@"ico_pinpai",@"ico_options"];
    NSArray *art = @[@"五金",@"建材",@"品牌",@"其他类"];
    
    for (int i = 0; i < arr.count; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake( (i + 1) * w + i * 40.0, 10, 40, 40)];
        [self.cutomView addSubview:btn];
        
        [btn setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((i + 1) * w + i * 40.0, 52, 40, 21)];
        label.text = art[i];
        [self.cutomView addSubview:label];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:13];
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake( 0, self.frame.size.height - 1, self.frame.size.width, 1)];
    
    view.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view];
}

- (void)createSdView
{
    _w = self.sdScrollView.frame.size.width;
    _h = self.sdScrollView.frame.size.height;
    
    for (int i = 0; i < self.titleArr.count; i++) {
        
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(_w * i, 0, _w, _h)];
        [self.sdScrollView addSubview:iv];
        
        [iv setImage:[UIImage imageNamed:self.dataArr[i]]];
        
    }
    
    self.sdScrollView.contentSize = CGSizeMake(self.dataArr.count * _w, _h);
    self.sdScrollView.contentOffset = CGPointMake(_w, 0);
    self.sdScrollView.pagingEnabled = YES;
    
    self.pc = [[UIPageControl alloc]initWithFrame:CGRectMake((_w -80) / 2.0, _h - 20, 80, 20)];
    
    self.page = 0;
    self.pc.numberOfPages = self.dataArr.count - 2;
    self.pc.currentPage = 0;
    //设置当前页的颜色
    _pc.currentPageIndicatorTintColor = [UIColor redColor];
    //其他页的颜色
    _pc.pageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:self.pc];
    
    //开启定时器 实现循环滚动
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeRefresh) userInfo:nil repeats:YES];
}

#pragma mark - 定时器
- (void)timeRefresh
{
    if (self.page == 4) {
        [self.sdScrollView scrollRectToVisible:CGRectMake(_w * (self.page + 1), 0, _w, _h) animated:YES];
        
        self.sdScrollView.contentOffset = CGPointMake(_w, 0);
        self.page = 0 ;
        
    }
    
    else
    {
        self.page ++;
        [self.sdScrollView scrollRectToVisible:CGRectMake(_w * (self.page + 1), 0, _w, _h) animated:YES];
    }
    NSLog(@"123");
    self.pc.currentPage = self.page;
}



- (void)createAdView
{
    _ad_w = self.adScrollView.frame.size.width;
    _ad_h = self.adScrollView.frame.size.height;
    
    for (int i = 0; i < self.titleArr.count; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _ad_h * i, _ad_w, _ad_h)];
        
        [self.adScrollView addSubview:label];
        
        label.text = self.titleArr[i];
        
    }
    
    self.adScrollView.contentSize = CGSizeMake(_ad_w, _ad_h * self.titleArr.count);
    self.adScrollView.contentOffset = CGPointMake(0, _ad_h);
    self.adScrollView.pagingEnabled = YES;
    
    //开启定时器 实现循环滚动
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(titleRefresh) userInfo:nil repeats:YES];

}

- (void)titleRefresh
{
    
    if (self.num == self.titleArr.count - 2) {
        [self.adScrollView scrollRectToVisible:CGRectMake( 0, _ad_h * (self.num + 1), _ad_w, _ad_h) animated:YES];
        
        self.adScrollView.contentOffset = CGPointMake( 0, _ad_h);
        self.num = 0 ;
        
    }
    else
    {
        self.num ++;
        [self.adScrollView scrollRectToVisible:CGRectMake( 0, _ad_h * (self.num + 1), _ad_w, _ad_h) animated:YES];
    }

    
}

@end
