//
//  ProductHeaderView.m
//  Product
//
//  Created by cy on 16/4/14.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductHeaderView.h"

@implementation ProductHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame With:(NSArray *)picArr And:(NSArray *)titleArr
{
    if (self = [super initWithFrame:frame]) {
     
        //实现顶部视图循环滚动
        self.dataArr = [NSMutableArray arrayWithArray:picArr];
        [self.dataArr insertObject:picArr.lastObject atIndex:0];
        [self.dataArr addObject:picArr.firstObject];
        
        //实现底部视图循环滚动
        self.titleArr = [NSMutableArray arrayWithArray:titleArr];
        [self.titleArr insertObject:titleArr.lastObject atIndex:0];
        [self.titleArr addObject:titleArr.firstObject];
        
        self.page = 0;
        self.num = 0;
        
        [self customView];
        
        [self createSdView];
        
        [self createAdView];
        
    }
    return self;
}


- (void)updateViewWith:(NSArray *)picArr And:(NSArray *)titleArr
{
    //实现顶部视图循环滚动
    self.dataArr = [NSMutableArray arrayWithArray:picArr];
    [self.dataArr insertObject:picArr.lastObject atIndex:0];
    [self.dataArr addObject:picArr.firstObject];
    
    //实现底部视图循环滚动
    self.titleArr = [NSMutableArray arrayWithArray:titleArr];
    [self.titleArr insertObject:titleArr.lastObject atIndex:0];
    [self.titleArr addObject:titleArr.firstObject];
    
    self.page = 0;
    self.num = 0;
    
    [self customView];
    
    [self createSdView];
    
    [self createAdView];
}

#pragma mark 自定义button
- (void)customView
{
    float w = (self.frame.size.width - 160) / 5.0;
    NSLog(@"%f",w);
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

#pragma mark 顶部视图滚动
- (void)createSdView
{
    _w = self.frame.size.width;
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
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timeRefresh) userInfo:nil repeats:YES];
}

#pragma mark - 顶部定时器
- (void)timeRefresh
{
    self.page ++;
    
    if (self.page == self.dataArr.count - 2)
    {
        [self.sdScrollView scrollRectToVisible:CGRectMake(_w * (self.page + 2), 0, _w, _h) animated:YES];
        
        self.sdScrollView.contentOffset = CGPointMake(_w, 0);
        self.page = 0 ;
    }
    
    else
    {
        [self.sdScrollView scrollRectToVisible:CGRectMake(_w * (self.page + 1), 0, _w, _h) animated:YES];
    }
    
    self.pc.currentPage = self.page;
}

#pragma mark 底部视图滚动
- (void)createAdView
{
    _ad_w = self.adScrollView.frame.size.width;
    _ad_h = self.adScrollView.frame.size.height;
    
    for (int i = 0; i < self.titleArr.count; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, _ad_h * i, _ad_w, _ad_h)];
        
        [self.adScrollView addSubview:btn];
        
        [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    }
    
    self.adScrollView.contentSize = CGSizeMake(_ad_w, _ad_h * self.titleArr.count);
    self.adScrollView.contentOffset = CGPointMake(0, _ad_h);
    self.adScrollView.pagingEnabled = YES;
    
    //开启定时器 实现循环滚动
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(titleRefresh) userInfo:nil repeats:YES];
    
}

#pragma mark 底部定时器
- (void)titleRefresh
{
    self.num ++;
    if (self.num == self.titleArr.count - 2) {
        [self.adScrollView scrollRectToVisible:CGRectMake( 0, _ad_h * (self.num + 2), _ad_w, _ad_h) animated:YES];
        
        self.adScrollView.contentOffset = CGPointMake( 0, _ad_h);
        self.num = 0 ;
        
    }
    
    else
    {
        [self.adScrollView scrollRectToVisible:CGRectMake( 0, _ad_h * (self.num + 1), _ad_w, _ad_h) animated:YES];
    }
}


@end
