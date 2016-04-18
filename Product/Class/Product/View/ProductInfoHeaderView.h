//
//  ProductInfoHeaderView.h
//  Product
//
//  Created by cy on 16/4/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductInfoHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *pd_InfoScrollView;
@property (weak, nonatomic) IBOutlet UILabel *pd_nameTF;
@property (weak, nonatomic) IBOutlet UILabel *pd_InfoName;

@property (nonatomic,strong) NSMutableArray *picArr;

@property (nonatomic,strong) UIPageControl *pc;
@property (nonatomic,assign) int page;

- (void)updateViewWith:(NSArray *)arr;
@end
