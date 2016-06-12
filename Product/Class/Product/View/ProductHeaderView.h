//
//  ProductHeaderView.h
//  Product
//
//  Created by cy on 16/4/14.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductHeaderView : UIView

@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UIScrollView *sdScrollView;
@property (weak, nonatomic) IBOutlet UIView *cutomView;
@property (weak, nonatomic) IBOutlet UIScrollView *adScrollView;

@property (nonatomic,copy) void(^btnBlcok)(int );

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSMutableArray *titleArr;

@property (nonatomic,strong) UIPageControl *pc;
@property (nonatomic,assign) int page;

@property (nonatomic,assign) float w;
@property (nonatomic,assign) float h;

@property (nonatomic,assign) float ad_w;
@property (nonatomic,assign) float ad_h;

@property (nonatomic,assign) int num;

- (void)updateViewWith:(NSArray *)picArr And:(NSArray *)titleArr;

@end
