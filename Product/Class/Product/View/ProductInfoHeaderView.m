//
//  ProductInfoHeaderView.m
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "ProductInfoHeaderView.h"

@interface ProductInfoHeaderView()
{
    float w;
    float h;
}
@end

@implementation ProductInfoHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)updateViewWith:(NSArray *)arr
{
    //实现顶部视图循环滚动
    self.picArr = [NSMutableArray arrayWithArray:arr];
    [self.picArr insertObject:arr.lastObject atIndex:0];
    [self.picArr addObject:arr.firstObject];
    self.page = 0;
        
    [self createSdView];

}

#pragma mark 顶部视图滚动
- (void)createSdView
{
    w = SCREEN_WIDTH;
    h = self.pd_InfoScrollView.frame.size.height;

    for (int i = 0; i < self.picArr.count; i++) {

    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(w * i, 0, w, h)];
    [self.pd_InfoScrollView addSubview:iv];

    [iv setImage:[UIImage imageNamed:self.picArr[i]]];

    }

    self.pd_InfoScrollView.contentSize = CGSizeMake(self.picArr.count * w, h);
    self.pd_InfoScrollView.contentOffset = CGPointMake(w, 0);
    self.pd_InfoScrollView.pagingEnabled = YES;

    self.pc = [[UIPageControl alloc]initWithFrame:CGRectMake((w -80) / 2.0, h - 40, 80, 20)];
    
    self.page = 0;
    self.pc.numberOfPages = self.picArr.count - 2;
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
    
    if (self.page == self.picArr.count - 2)
    {
        [self.pd_InfoScrollView scrollRectToVisible:CGRectMake(w * (self.page + 2), 0, w, h) animated:YES];
        
        self.pd_InfoScrollView.contentOffset = CGPointMake(w, 0);
        self.page = 0 ;
    }
    
    else
    {
        [self.pd_InfoScrollView scrollRectToVisible:CGRectMake(w * (self.page + 1), 0, w, h) animated:YES];
    }
    
    self.pc.currentPage = self.page;
}


@end
